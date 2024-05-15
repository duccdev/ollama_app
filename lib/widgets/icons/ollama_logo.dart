import 'package:flutter/material.dart';

class OllamaLogo extends StatelessWidget {
  const OllamaLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png',
        width: width ?? 48, height: height ?? 48);
  }
}
