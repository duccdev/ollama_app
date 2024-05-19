import 'package:flutter/material.dart';
import 'package:ollama_app/types/message.dart';
import 'package:ollama_app/widgets/ez/message.dart';
import 'package:ollama_app/widgets/ez/textfield.dart';
import 'package:ollama_app/utils/api.dart' as api;
import 'package:ollama_app/widgets/icons/ollama_logo.dart';
import 'package:ollama_app/widgets/icons/usercircle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
            children: _messages
                .map((message) => EzMessage(message: message))
                .toList()),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: EzTextField(
            hintText: 'Message Ollama',
            onSubmitted: (text) async {
              setState(() {
                _messages.add(Message(
                  username: 'You',
                  content: text,
                  pfp: const UserCircle(size: 55),
                ));

                _messages.add(Message(
                  username: 'LLaMA 3',
                  content: null,
                  pfp: const OllamaLogo(width: 55, height: 55),
                ));
              });

              String? res = await api.infer(text, 'llama3');
              if (res == null) {
                setState(() {
                  _messages.last.error = true;
                  _messages.last.content = 'Failed to infer Ollama!';
                });

                return;
              }

              setState(() => _messages.last.content = res);
            },
          ),
        ),
      ],
    );
  }
}
