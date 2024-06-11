import 'package:flutter/material.dart';

Widget basicIconButton({
  required Icon icon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
    ),
    icon: icon,
    onPressed: onPressed,
  );
}
