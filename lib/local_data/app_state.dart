import 'dart:typed_data';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class AppState {
  static final AppState _singleton = AppState._internal();
  static Rx<LoginData?> loginData = Rx<LoginData?>(null);
  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();

  static downloadFile(String url) async {
    final response = await BaseApiService.instance.getNormal(url,
        options: Options(
            headers: {"responseType": "blob"},
            responseType: ResponseType.bytes));
    Uint8List imageInUnit8List = response!.data;
    var documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationSupportDirectory();
    var firstPath = documentDirectory!.path + "/media";
    var filePathAndName =
        documentDirectory.path + '/media/${url.split("/").last}';
    await Directory(firstPath).create(recursive: true);
    File file = File(filePathAndName);
    file.writeAsBytesSync(imageInUnit8List);
    Get.snackbar('', '',
        titleText: Text("Download success"),
        messageText: Text("$filePathAndName"));
  }
}
