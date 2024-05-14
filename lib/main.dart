import 'package:flutter/material.dart';
import 'package:ollama_app/routes/home.dart';

void main() {
  runApp(const Entry());
}

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ollama',
      home: Scaffold(body: Home()),
    );
  }
}
