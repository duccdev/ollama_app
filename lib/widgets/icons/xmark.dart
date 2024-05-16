import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class XMark extends StatelessWidget {
  const XMark({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return HeroIcon(
      HeroIcons.xMark,
      color: color ?? Colors.white,
      style: HeroIconStyle.mini,
      size: size ?? 32,
    );
  }
}
