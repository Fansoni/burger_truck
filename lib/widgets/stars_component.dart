import 'package:flutter/material.dart';

class StarsComponent extends StatelessWidget {
  final int number;
  const StarsComponent({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            Icons.star,
            size: 20.0,
            color: (i <= number) ? Colors.orange[700] : Colors.grey,
          ),
      ],
    );
  }
}
