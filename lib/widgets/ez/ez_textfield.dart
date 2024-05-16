import 'package:flutter/material.dart';
import 'package:ollama_app/constants.dart';

class EzTextField extends StatelessWidget {
  const EzTextField({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(9999),
        right: Radius.circular(9999),
      ),
    );

    return SizedBox(
      height: 48,
      child: TextField(
        style: TextStyle(color: ctp.text, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          filled: true,
          fillColor: ctp.surface2,
          border: border,
          focusedBorder: border,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          hintText: 'Message Ollama',
          hintStyle: TextStyle(
            color: ctp.overlay2,
            fontWeight: FontWeight.w600,
          ),
        ),
        cursorColor: ctp.lavender,
      ),
    );
  }
}
