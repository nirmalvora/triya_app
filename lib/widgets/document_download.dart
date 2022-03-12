import 'dart:io';

import 'package:flutter/material.dart';
import 'package:triya_app/constants/string_res.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/utils/api_loader.dart';
import 'package:triya_app/utils/dialogs_utils.dart';
import 'package:triya_app/utils/toast_utils.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> checkFileExist(
    {String? docLink, String? docName, required BuildContext context}) async {
  final String? filename = docName;
  final dir = await getApplicationDocumentsDirectory();
  File file = File("${dir.path}/$filename.${docLink!.split(".").last}");
  if ((await file.exists())) {
    await OpenFile.open(file.path);
  } else {
    downloadFile(docLink, context, dir, filename);
  }
}

Future<void> downloadFile(String? docLink, BuildContext context, Directory dir,
    String? filename) async {
  if (await Permission.storage.request().isGranted) {
    try {
      ProgressDialogUtils.showProgressDialog();
      String filePAth = '${dir.path}/$filename.${docLink!.split(".").last}';
      final response = await BaseApiService()
          .download(documentLink: docLink, documentPath: filePAth)
          .catchError((error) {
        showAlertDialog(error);
        ProgressDialogUtils.dismissProgressDialog();
      });
      if (response!.statusCode == 200) {
        ProgressDialogUtils.dismissProgressDialog();
        OpenFile.open(filePAth);
      }
    } catch (e) {
      ProgressDialogUtils.dismissProgressDialog();
    }
  } else {
    ToastUtils.showFailed(message: StringRes.grantPermission);
  }
}
