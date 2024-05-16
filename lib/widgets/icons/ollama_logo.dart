import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';

class OllamaLogo extends StatelessWidget {
  const OllamaLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Globals.ctp == catppuccin.latte
        ? Image.asset('assets/images/logo_latte.png',
            width: width ?? 48, height: height ?? 48)
        : Image.asset('assets/images/logo.png',
            width: width ?? 48, height: height ?? 48);
  }
}
