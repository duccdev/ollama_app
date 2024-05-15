import 'package:flutter/material.dart';
import 'package:ollama_app/constants.dart';
import 'package:ollama_app/routes/home.dart';
import 'package:ollama_app/routes/settings.dart';
import 'package:ollama_app/widgets/ez/ez_appbar.dart';

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
      home: Scaffold(
        backgroundColor: ctp.base,
        body: const Padding(padding: EdgeInsets.all(8), child: Home()),
        appBar: const EzAppBar(),
      ),
    );
  }
}
