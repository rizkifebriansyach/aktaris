import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:image/image.dart' as img;

class MediaInfo {
  String path;
  MediaType type;
  MediaInfo(this.path, this.type);
}

enum MediaType {
  file,
  image,
  video,
  unknown,
}

class MediaHelper {
  String tag = 'MediaHelper :';
  static const imageExtensions = ["png", "jpg", "jpeg", "gif", "webp"];
  static const videoExtensions = ["mp4", "mov", "mkv", "avi"];
  static const fileExtensions = [
    "pdf",
    "doc",
    "docx",
    "odt",
    'ppt',
    'pptx',
    "xls",
    "xlsx",
    "csv",
    "psd",
    "txt",
    "zip",
    "rar"
  ];

  static String generateAvatarByName(String name) {
    return 'https://ui-avatars.com/api/?size=256&name=$name';
  }

  static MediaInfo getMediaType(String path) {
    final extension = path.startsWith('http')
        ? p.extension(path).replaceFirst(".", "").split("?").first
        : p.extension(path).replaceFirst(".", "");

    if (imageExtensions.contains(extension.toLowerCase())) {
      return MediaInfo(path, MediaType.image);
    } else if (videoExtensions.contains(extension.toLowerCase())) {
      return MediaInfo(path, MediaType.video);
    } else if (fileExtensions.contains(extension.toLowerCase())) {
      return MediaInfo(path, MediaType.file);
    } else {
      return MediaInfo(path, MediaType.unknown);
    }
  }

  static Future<Uint8List> compressBytes(Uint8List list) async {
    Uint8List result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 20,
    );
    debugPrint(list.length.toString());
    debugPrint(result.length.toString());
    return result;
  }

  static Future<File> compressImage({
    required File file,
    required int limit,
  }) async {
    int minLimit = 1000000;
    if (limit < minLimit) limit = minLimit;
    int size = file.lengthSync();
    while (size >= limit) {
      Uint8List? result = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        minWidth: 1024,
        minHeight: 1024,
        quality: 80,
      );
      img.Image image = img.decodeJpg(result!)!;
      File(file.path).writeAsBytesSync(img.encodePng(image));
      size = file.lengthSync();
    }
    return file;
  }

  static Future<File?> pickImage({
    required ImageSource source,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool withCompression = false,
    String? fileName,
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
    int sizeLimit = 2000000,
  }) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: withCompression ? 1024 : maxHeight,
      maxWidth: withCompression ? 1024 : maxWidth,
      imageQuality: imageQuality,
      preferredCameraDevice: preferredCameraDevice,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      if (withCompression) {
        imageFile = await compressImage(
          file: imageFile,
          limit: sizeLimit,
        );
      }

      if (fileName != null) {
        // Get the directory path of the original file
        String dir = imageFile.parent.path;
        // Create the new file path by combining the directory path and the new file name
        String newPath = '$dir/$fileName';
        // Rename the file by moving it to the new path
        await imageFile.rename(newPath);
        // Return the renamed file
        return File(newPath);
      } else {
        // If no new file name is provided, return the original file
        return imageFile;
      }
      // String dir = p.dirname(imageFile.path);
      // String newName = p.join(dir, fileName);
      // imageFile.renameSync(newName);
      // return imageFile;
    }
    return null;
  }

  static Future<File?> pickFile({
    required ImageSource source,
    FileType fileType = FileType.any,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowMultiple: false,
      allowedExtensions: ["pdf"]
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      return File(file.path!);
    }

    return null;
  }

  static Future<File?> pickVideo({
    required ImageSource source,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    Duration? maxDuration,
  }) async {
    XFile? pickedFile = await ImagePicker().pickVideo(
      source: source,
      preferredCameraDevice: preferredCameraDevice,
      maxDuration: maxDuration ?? const Duration(seconds: 20),
    );
    return File(pickedFile!.path);
  }
}
