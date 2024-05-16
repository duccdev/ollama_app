import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ArrowUp extends StatelessWidget {
  const ArrowUp({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return HeroIcon(
      HeroIcons.arrowUp,
      color: color ?? Colors.white,
      style: HeroIconStyle.mini,
      size: size ?? 32,
    );
  }
}
