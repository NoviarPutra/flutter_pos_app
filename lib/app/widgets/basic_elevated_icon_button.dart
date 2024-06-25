import 'package:flutter/material.dart';

import '../../utils/color_pallete.dart';

class BasicElevatedButtonIcon extends StatelessWidget {
  const BasicElevatedButtonIcon({
    super.key,
    this.color = primary,
    required this.onPressed,
    required this.title,
    this.loadingText = "Loading...",
    this.isLoading = false,
    this.textColor = Colors.white,
    required this.icon,
  });

  final Color color;
  final VoidCallback onPressed;
  final String title;
  final String loadingText;
  final bool isLoading;
  final Color textColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isLoading ? Colors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        icon: icon,
        label: FittedBox(
          child: Text(
            isLoading ? loadingText : title,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
