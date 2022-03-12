import 'package:flutter/material.dart';

extension Validation on String {
  String? isEmptyValue(BuildContext context, String message) {
    if (isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  String? isEmptyValueLength(BuildContext context,
      {String? emptyMessage, String? lengthMessage, int length = 2}) {
    if (isEmpty) {
      return emptyMessage;
    } else if (trim().length < length) {
      return lengthMessage;
    } else {
      return null;
    }
  }

  String? isLength(BuildContext context,
      {String? emptyMessage, String? lengthMessage, int length = 2}) {
    if (isEmpty) {
      return null;
    } else if (trim().length < length) {
      return lengthMessage;
    } else {
      return null;
    }
  }
}
