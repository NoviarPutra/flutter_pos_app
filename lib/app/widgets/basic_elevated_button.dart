import 'package:flutter/material.dart';
import 'package:pos_app/utils/color_pallete.dart';

class BasicElevatedButton extends StatelessWidget {
  const BasicElevatedButton({
    super.key,
    this.color = primary,
    required this.onPressed,
    required this.title,
    this.loadingText = "Loading...",
    this.isLoading = false,
    this.textColor = Colors.white,
  });

  final Color color;
  final VoidCallback onPressed;
  final String title;
  final String loadingText;
  final bool isLoading;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isLoading ? Colors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: FittedBox(
          child: Text(
            isLoading ? loadingText : title,
            style: TextStyle(
              color: isLoading ? Colors.black : textColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
