import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToast {
  static final CustomToast _instance = CustomToast._internal();
  OverlayEntry? _overlayEntry;
  Timer? _timer;

  factory CustomToast() {
    return _instance;
  }

  CustomToast._internal();

  void show(BuildContext context, String message) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _timer?.cancel();
    }

    _overlayEntry = OverlayEntry(builder: (context) {
      final mediaQuery = Get.mediaQuery;
      final screenWidth = mediaQuery.size.width;
      final screenHeight = mediaQuery.size.height;

      return Positioned(
        bottom: screenHeight * 0.1,
        left: screenWidth * 0.1,
        width: screenWidth * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });

    final overlay = Overlay.of(context);
    overlay.insert(_overlayEntry!);

    _timer = Timer(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}
