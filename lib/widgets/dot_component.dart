import 'package:flutter/material.dart';

class DotComponent extends StatelessWidget {
  const DotComponent({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3.0, right: 3.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        color: (isSelected) ? Colors.white : Colors.grey,
      ),
    );
  }
}
