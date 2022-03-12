import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:triya_app/constants/string_res.dart';
import 'package:triya_app/utils/api_loader.dart';
import 'package:triya_app/utils/dialogs_utils.dart';

import '../model/basemodel/basemodel.dart';

Future<void> errorHandling({
  required DioError error,
  required callBack,
}) async {
  debugPrint(error.response.toString());
  switch (error.response?.statusCode) {
    case 422:
      ProgressDialogUtils.dismissProgressDialog();
      showAlertDialog(StringRes.somethingWentWrong);
      break;
    case 405:
      //Could not set notification as read
      break;
    case 500:
      ProgressDialogUtils.dismissProgressDialog();
      showAlertDialog(StringRes.somethingWentWrong);
      break;
    case 503:
      ProgressDialogUtils.dismissProgressDialog();
      showAlertDialog(StringRes.somethingWentWrong);
      break;
    default:
      ProgressDialogUtils.dismissProgressDialog();
      try {
        if (error.response?.data != null &&
            error.response?.data is Map<String, dynamic>) {
          BaseModel data = BaseModel.fromJson(error.response?.data);
          showAlertDialog(data.message ?? StringRes.somethingWentWrong);
        } else {
          showAlertDialog(StringRes.somethingWentWrong);
        }
      } catch (e) {
        showAlertDialog(StringRes.somethingWentWrong);
        // showAlertDialog(error.message.toString());
        rethrow;
      }
  }
}

Future<void> sentryError({
  required DioError error,
}) async {}
