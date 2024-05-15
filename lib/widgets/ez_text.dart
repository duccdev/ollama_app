import 'package:flutter/material.dart';
import 'package:ollama_app/constants.dart';

class EzText extends StatelessWidget {
  const EzText(this.content,
      {super.key, this.fontSize, this.color, this.textAlign, this.bold});

  final String content;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 24,
        color: color ?? ctp.text,
        fontWeight: (bold ?? false) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
