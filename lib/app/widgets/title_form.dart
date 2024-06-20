import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {
  const TitleForm({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Text(title),
    );
  }
}
