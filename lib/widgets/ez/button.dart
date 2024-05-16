import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';

typedef OnPressedCallback = void Function();

class EzButton extends StatelessWidget {
  const EzButton({super.key, required this.child, required this.onPressed});

  final Widget child;
  final OnPressedCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Globals.ctp.surface0),
      child: child,
    );
  }
}
