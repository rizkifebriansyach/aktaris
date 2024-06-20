import 'dart:io';

import 'package:aktaris_app/core/helper/file_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../presentation/widget/custom_icon.dart';

class PreviewCameraPage extends StatelessWidget {
  final File imageFile;
  final bool showInfo;
  const PreviewCameraPage({
    Key? key,
    required this.imageFile,
    required this.showInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(imageFile.path),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.all(25),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleIcon(
                        onPressed: () => Get.back(),
                        // backgroundColor: Colors.black54.withOpacity(0.8),
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        icon: Icons.close,
                      ),
                      CircleIcon(
                        onPressed: () async {
                          if (showInfo) {
                            showImageInfo(context);
                          }
                          Get.back(result: File(imageFile.path));
                        },
                        // backgroundColor: Colors.black54.withOpacity(0.8),
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        icon: Icons.check,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showImageInfo(BuildContext context) async {
    // Show Image Info
    String size = await FileHelper.getFileSizeString(imageFile.path, 2);
    Fluttertoast.showToast(msg: "$size, ${imageFile.path}");
  }
}