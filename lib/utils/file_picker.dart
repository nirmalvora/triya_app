import 'dart:io';

import 'package:flutter/services.dart';
import 'package:triya_app/constants/string_res.dart';
import 'package:triya_app/utils/dialogs_utils.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

// Pick Image From Gallery
Future<File> getImageFromGallery() async {
  final _picker = ImagePicker();
  File? file;
  try {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
    // ignore: unused_catch_clause
  } on PlatformException catch (error) {
    showAlertDialog(StringRes.cameraPermission);
  }
  return file!;
}

// Pick Image From Camera
Future<File> getImageFromCamera() async {
  final _picker = ImagePicker();
  File? file;
  try {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
    // ignore: unused_catch_clause
  } on PlatformException catch (e) {
    showAlertDialog(StringRes.cameraPermission);
  }
  return file!;
}

MediaType getImageContentType({required String filePath}) {
  final extensionName = getFileExtension(filePath: filePath);
  if (extensionName == 'jpg' || extensionName == 'jpeg') {
    return MediaType('image', 'jpg');
  } else {
    return MediaType('image', 'png');
  }
}

String getFileExtension({required String filePath}) {
  return filePath.split('.').last.toLowerCase();
}
