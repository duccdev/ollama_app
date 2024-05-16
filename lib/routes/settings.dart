import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/scaffold.dart';
import 'package:ollama_app/widgets/ez/text.dart';
import 'package:ollama_app/widgets/icons/cog6tooth.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return EzScaffold(
      appBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Cog6Tooth(color: Globals.ctp.text),
          ),
          const EzText('Settings'),
        ],
      ),
      centerAppBar: true,
      body: const EzText('Hello, World!'),
    );
  }
}
