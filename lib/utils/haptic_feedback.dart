import 'package:flutter/services.dart';

class CustomHapticFeedback {
  static void runHaptic({int priority = 1}) {
    switch (priority) {
      case 0:
        HapticFeedback.lightImpact();
        break;
      case 1:
        HapticFeedback.mediumImpact();
        break;
      case 2:
        HapticFeedback.heavyImpact();
        break;
      default:
        HapticFeedback.mediumImpact();
    }
  }
}
