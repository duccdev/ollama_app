import 'package:flutter/material.dart';
import 'package:ollama_app/constants.dart';
import 'package:ollama_app/routes/home.dart';
import 'package:ollama_app/widgets/ez_text.dart';
import 'package:ollama_app/widgets/ollama_logo.dart';

void main() {
  runApp(const Entry());
}

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ollama',
      home: Scaffold(
        backgroundColor: ctp.base,
        body: const Padding(padding: EdgeInsets.all(8), child: Home()),
        appBar: AppBar(
          backgroundColor: ctp.surface2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: OllamaLogo(),
                  ),
                  EzText('Ollama', color: Colors.white, bold: true),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, color: ctp.blue, size: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
