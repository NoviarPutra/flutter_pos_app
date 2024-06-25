import 'package:flutter/material.dart';

class BasicIconButton extends StatelessWidget {
  const BasicIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
        ),
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
