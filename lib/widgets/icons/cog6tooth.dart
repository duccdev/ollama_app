import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Cog6Tooth extends StatelessWidget {
  const Cog6Tooth({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return HeroIcon(
      HeroIcons.cog6Tooth,
      color: color ?? Colors.white,
      style: HeroIconStyle.mini,
      size: size ?? 32,
    );
  }
}
