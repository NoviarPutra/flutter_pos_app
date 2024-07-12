import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_toast.dart';

class AppUtils {
  static DateTime? _lastPressed;
  static Future<void> onBackPressed(BuildContext context) async {
    final currentTime = DateTime.now();
    const duration = Duration(seconds: 2);
    bool checkPressed = _lastPressed == null ||
        currentTime.difference(_lastPressed!) > duration;
    if (checkPressed) {
      _lastPressed = currentTime;
      CustomToast().show(context, 'Tekan sekali lagi untuk keluar');
    } else {
      SystemNavigator.pop();
    }
  }
}
