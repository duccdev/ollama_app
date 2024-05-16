import 'package:flutter/material.dart';
import 'package:ollama_app/widgets/ez/textfield.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: EzTextField(hintText: 'Message Ollama'),
        ),
      ),
    );
  }
}
