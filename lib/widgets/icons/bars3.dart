import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Bars3 extends StatelessWidget {
  const Bars3({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return HeroIcon(
      HeroIcons.bars3,
      color: color ?? Colors.white,
      style: HeroIconStyle.mini,
      size: size ?? 32,
    );
  }
}
