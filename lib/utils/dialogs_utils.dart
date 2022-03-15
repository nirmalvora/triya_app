// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/string_res.dart';

void showOkCancelAlertDialog({
  required BuildContext context,
  required String message,
  String? okButtonTitle,
  String? cancelButtonTitle,
  Function? cancelButtonAction,
  Function? okButtonAction,
  bool isCancelEnable = true,
}) {
  showDialog(
    barrierDismissible: isCancelEnable,
    context: context,
    builder: (context) {
      if (Platform.isIOS) {
        return _showOkCancelCupertinoAlertDialog(
            context,
            message,
            okButtonTitle,
            cancelButtonTitle,
            okButtonAction,
            isCancelEnable,
            cancelButtonAction);
      } else {
        return _showOkCancelMaterialAlertDialog(
            context,
            message,
            okButtonTitle,
            cancelButtonTitle,
            okButtonAction,
            isCancelEnable,
            cancelButtonAction);
      }
    },
  );
}

void showAlertDialog(String message) {
  Get.snackbar(
    message,
    "",
  );
}

CupertinoAlertDialog _showCupertinoAlertDialog(String message) {
  return CupertinoAlertDialog(
    title: const Text(StringRes.appName),
    content: Text(message),
    actions: _actions(),
  );
}

AlertDialog _showMaterialAlertDialog(String message) {
  return AlertDialog(
    title: const Text(StringRes.appName),
    content: Text(message),
    actions: _actions(),
  );
}

AlertDialog _showOkCancelMaterialAlertDialog(
    BuildContext context,
    String message,
    String? okButtonTitle,
    String? cancelButtonTitle,
    Function? okButtonAction,
    bool isCancelEnable,
    Function? cancelButtonAction) {
  return AlertDialog(
    title: const Text(StringRes.appName),
    content: Text(message),
    actions: isCancelEnable
        ? _okCancelActions(
            context: context,
            okButtonTitle: okButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            okButtonAction: okButtonAction,
            isCancelEnable: isCancelEnable,
            cancelButtonAction: cancelButtonAction,
          )
        : _okAction(
            context: context,
            okButtonAction: okButtonAction,
            okButtonTitle: okButtonTitle),
  );
}

CupertinoAlertDialog _showOkCancelCupertinoAlertDialog(
  BuildContext context,
  String message,
  String? okButtonTitle,
  String? cancelButtonTitle,
  Function? okButtonAction,
  bool isCancelEnable,
  Function? cancelButtonAction,
) {
  return CupertinoAlertDialog(
      title: const Text(StringRes.appName),
      content: Text(message),
      actions: isCancelEnable
          ? _okCancelActions(
              context: context,
              okButtonTitle: okButtonTitle,
              cancelButtonTitle: cancelButtonTitle,
              okButtonAction: okButtonAction,
              isCancelEnable: isCancelEnable,
              cancelButtonAction: cancelButtonAction,
            )
          : _okAction(
              context: context,
              okButtonAction: okButtonAction,
              okButtonTitle: okButtonTitle));
}

List<Widget> _actions() {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            child: const Text(StringRes.ok),
            onPressed: () {
              Get.back();
            },
          )
        : TextButton(
            child: const Text(StringRes.ok),
            onPressed: () {
              Get.back();
            },
          ),
  ];
}

List<Widget> _okCancelActions({
  BuildContext? context,
  String? okButtonTitle,
  String? cancelButtonTitle,
  Function? okButtonAction,
  bool? isCancelEnable,
  Function? cancelButtonAction,
}) {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text(cancelButtonTitle ?? StringRes.no),
            onPressed: cancelButtonAction == null
                ? () {
                    Navigator.of(context!).pop();
                  }
                : () {
                    Navigator.of(context!).pop();
                    cancelButtonAction();
                  },
          )
        : TextButton(
            child: Text(cancelButtonTitle ?? StringRes.no),
            onPressed: cancelButtonAction == null
                ? () {
                    Navigator.of(context!).pop();
                  }
                : () {
                    Navigator.of(context!).pop();
                    cancelButtonAction();
                  },
          ),
    Platform.isIOS
        ? CupertinoDialogAction(
            child: Text(okButtonTitle ?? StringRes.yes),
            onPressed: () {
              Navigator.of(context!).pop();
              okButtonAction!();
            },
          )
        : TextButton(
            child: Text(okButtonTitle ?? StringRes.yes),
            onPressed: () {
              Navigator.of(context!).pop();
              okButtonAction!();
            },
          ),
  ];
}

List<Widget> _okAction(
    {BuildContext? context, String? okButtonTitle, Function? okButtonAction}) {
  return <Widget>[
    Platform.isIOS
        ? CupertinoDialogAction(
            child: Text(okButtonTitle!),
            onPressed: () {
              Navigator.of(context!).pop();
              okButtonAction!();
            },
          )
        : TextButton(
            child: Text(okButtonTitle!),
            onPressed: () {
              Navigator.of(context!).pop();
              okButtonAction!();
            },
          ),
  ];
}
