import 'package:burger_truck/widgets/dot_component.dart';
import 'package:flutter/material.dart';

class CarouselDots extends StatelessWidget {
  final dynamic photoLength, indexSelected;

  const CarouselDots({super.key, this.photoLength, this.indexSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        photoLength,
        (index) => DotComponent(isSelected: index == indexSelected),
        growable: false,
      ),
    );
  }
}
