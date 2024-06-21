import 'package:flutter/material.dart';
import 'package:pos_app/app/widgets/basic_icon_button.dart';

class ButtonCounter extends StatelessWidget {
  const ButtonCounter({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BasicIconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        Text(counter.toString()),
        const SizedBox(width: 10),
        BasicIconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
