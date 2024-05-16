import 'package:flutter/material.dart';
import 'package:ollama_app/routes/home.dart';
import 'package:ollama_app/routes/settings.dart';
import 'package:ollama_app/widgets/ez/scaffold.dart';

void main() {
  runApp(const Entry());
}

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ollama',
      theme: ThemeData(fontFamily: 'OpenSans'),
      routes: {
        '/settings': (context) => const Settings(),
      },
      home: const EzScaffold(
        body: Home(),
      ),
    );
  }
}
