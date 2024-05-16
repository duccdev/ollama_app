import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';

class EzText extends StatelessWidget {
  const EzText(this.content,
      {super.key,
      this.fontSize,
      this.color,
      this.textAlign,
      this.bold,
      this.semibold});

  final String content;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final bool? bold;
  final bool? semibold;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 24,
        color: color ?? Globals.ctp.text,
        fontWeight: (bold ?? false)
            ? FontWeight.w700
            : ((semibold ?? false) ? FontWeight.w600 : FontWeight.normal),
      ),
    );
  }
}
