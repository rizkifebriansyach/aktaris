import 'dart:io';

import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/core/modules/camera_preview.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

import '../../presentation/widget/custom_icon.dart';
import '../../presentation/widget/platform_loading_indicator.dart';

enum CameraType {
  REAR,
  FRONT,
}

T? _ambiguate<T>(T? value) => value;

class CameraModule extends StatefulWidget {
  final CameraType cameraType;
  final bool showInfo;
  final ResolutionPreset resolutionPreset;
  const CameraModule(
      {Key? key,
      required this.cameraType,
      required this.showInfo,
      this.resolutionPreset = ResolutionPreset.high})
      : super(key: key);

  @override
  _CameraModuleState createState() => _CameraModuleState();
}

class _CameraModuleState extends State<CameraModule>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  int? selectedCameraIndex;

  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;

  onInit() async {
    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeIn,
    );
    await availableCameras().then((value) {
      if (value.isNotEmpty) {
        cameras = value;
        if (cameras!.isNotEmpty) {
          if (widget.cameraType == CameraType.REAR) {
            selectedCameraIndex = 0;
          } else {
            selectedCameraIndex = 1;
          }
          initCamera(cameras![selectedCameraIndex!]).then((_) {});
        } else {
          Fluttertoast.showToast(msg: "Kamera tidak ditemukan");
        }
      }
    }).catchError((e) {
      DialogHelper.failed(
          title: "Gagal", message: e.toString(), onConfirm: () => Get.back());
    });
  }

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);
    onInit();
  }

  @override
  void dispose() {
    super.dispose();
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    _cameraController?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _cameraController;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera(cameraController.description);
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
    }
    _cameraController =
        CameraController(cameraDescription, widget.resolutionPreset);
    _cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_cameraController!.value.hasError) {
      Fluttertoast.showToast(msg: "Terjadi kesalahan pada kamera.");
    }

    try {
      _cameraController!.initialize();
    } catch (e) {
      debugPrint("Terjadi kesalahan pada kamera.\n$e");
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: cameraPreview(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(6),
                color: Colors.black.withOpacity(0.3),
                // color: primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                    const Spacer(),
                    _flashModeControlRowWidget(),
                    flashCameraButton(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                padding: const EdgeInsets.all(25),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    cameraButton(context),
                    flipCameraButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cameraPreview() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return loadingIndicator;
    }
    var camera = _cameraController!.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(_cameraController!),
      ),
    );
    // return Stack(
    //   children: [
    //     Center(
    //       child: CameraPreview(_cameraController!),
    //     ),
    //     Column(
    //       children: [
    //         Container(
    //           height: (MediaQuery.of(context).size.height - MediaQuery.of(context).size.width)/2 - 15,
    //           color: Colors.black.withOpacity(0.3),
    //         ),
    //         Center(
    //           child: AspectRatio(
    //             aspectRatio: MediaQuery.of(context).size.width /
    //                 MediaQuery.of(context).size.width,
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: CustomPaint(
    //                 foregroundPainter: BorderPainter(),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           height: (MediaQuery.of(context).size.height - MediaQuery.of(context).size.width)/2 - 15,
    //           color: Colors.black.withOpacity(0.3),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }

  Widget cameraButton(context) {
    return Align(
      alignment: Alignment.topCenter,
      // child: InkWell(
      //   onTap: () => onCapture(context),
      //   child: CircleAvatar(
      //     backgroundColor: Colors.white,
      //     radius: 40,
      //     child: CircleAvatar(
      //       backgroundColor: Colors.black.withOpacity(1),
      //       radius: 33,
      //       child: CircleAvatar(
      //         backgroundColor: Colors.white,
      //         radius: 25,
      //       ),
      //     ),
      //   ),
      // ),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 40,
        child: IconButton(
          icon: const Icon(
            Icons.camera,
            color: Colors.white,
          ),
          onPressed: () => onCapture(context),
          iconSize: 50,
        ),
      ),
    );
  }

  onCapture(context) async {
    try {
      CameraLensDirection lensDirection =
          cameras![selectedCameraIndex!].lensDirection;
      await _cameraController!.takePicture().then((value) async {
        File imageCaptured;
        if (lensDirection == CameraLensDirection.front) {
          imageCaptured = await flipSelfieImage(value);
        } else {
          imageCaptured = File(value.path);
        }
        // var cropedImg = await squareCropImage(imageCaptured);
        final arguments = Get.to(() => PreviewCameraPage(
              imageFile: imageCaptured,
              showInfo: widget.showInfo,
            ));
        arguments?.then((value) {
          if (value != null) {
            Get.back(result: value);
          }
        });
      });
    } catch (e) {
      // showToast(context, 'Error : ${e.toString()}');
      debugPrint('Error : ${e.toString()}');
    }
  }

  // Future<File> takePicture() async {
  //   Directory root = await getTemporaryDirectory();
  //   String directoryPath = '${root.path}/doc';
  //   await Directory(directoryPath).create(recursive: true);
  //   String filePath = '$directoryPath/${DateTime.now()}.jpg';

  //   try {
  //     await _cameraController?.takePicture();
  //   } catch (e) {
  //     return null;
  //   }

  //   return File(filePath);
  // }

  Future<File> squareCropImage(File image) async {
    final img.Image? capturedImage = img.decodeImage(await image.readAsBytes());
    var croppedImg = img.copyResizeCropSquare(capturedImage!, size: 1080);
    File result = await image.writeAsBytes(img.encodeJpg(croppedImg));
    return result;
  }

  Future<File> flipSelfieImage(XFile image) async {
    final img.Image? capturedImage =
        img.decodeImage(await File(image.path).readAsBytes());
    final img.Image orientedImage = img.flipHorizontal(capturedImage!);
    // var croppedImage = img.copyResizeCropSquare(capturedImage!, 1080);
    // final img.Image orientedImage = img.flipHorizontal(croppedImage);
    File flipedImage =
        await File(image.path).writeAsBytes(img.encodeJpg(orientedImage));
    debugPrint('PATH FILE : $flipedImage');
    return flipedImage;
  }

  // ---------------------------------------------------------------
  //                     CHANGE CAMERA MODE
  // ---------------------------------------------------------------

  flipCameraButton() {
    if (cameras == null) {
      return Container();
    }
    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: CircleIcon(
          onPressed: () => onSwitchCamera(),
          color: Colors.white,
          backgroundColor: Colors.black54.withOpacity(0.8),
          icon: getCameraLensIcon(lensDirection),
        ),
      ),
    );
  }

  getCameraLensIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.external:
        return CupertinoIcons.switch_camera;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex! < cameras!.length - 1
        ? selectedCameraIndex! + 1
        : 0;
    CameraDescription selectedCamera = cameras![selectedCameraIndex!];
    initCamera(selectedCamera);
  }

  // ---------------------------------------------------------------
  //                          FLASH MODE
  // ---------------------------------------------------------------

  flashCameraButton() {
    if (cameras == null) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: CircleIcon(
        onPressed: () => onFlashModeButtonPressed(),
        color: Colors.white,
        backgroundColor: Colors.black54.withOpacity(0),
        icon: Icons.flash_on,
      ),
    );
  }

  onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
    }
  }

  Widget _flashModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.flash_off),
              color: _cameraController?.value.flashMode == FlashMode.off
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_auto),
              color: _cameraController?.value.flashMode == FlashMode.auto
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_on),
              color: _cameraController?.value.flashMode == FlashMode.always
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.highlight),
              color: _cameraController?.value.flashMode == FlashMode.torch
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      // showToast(context, 'Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (_cameraController == null) {
      return;
    }

    try {
      await _cameraController!.setFlashMode(mode);
    } on CameraException catch (e) {
      logError(e.code, e.description);
      Fluttertoast.showToast(msg: "Error: ${e.code}\n${e.description}");
      rethrow;
    }
  }

  void logError(String code, String? message) {
    if (message != null) {
      debugPrint("Error: $code\nError Message: $message");
    } else {
      debugPrint("Error: $code");
    }
  }
}
