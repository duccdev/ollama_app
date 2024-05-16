import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/button.dart';
import 'package:ollama_app/widgets/ez/dropdown.dart';
import 'package:ollama_app/widgets/ez/scaffold.dart';
import 'package:ollama_app/widgets/ez/text.dart';
import 'package:ollama_app/widgets/ez/textfield.dart';
import 'package:ollama_app/widgets/icons/check.dart';
import 'package:ollama_app/widgets/icons/cog6tooth.dart';
import 'package:ollama_app/widgets/icons/xmark.dart';
import 'package:ollama_app/widgets/rerender_widget.dart';
import 'package:ollama_app/utils/api.dart' as api;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Map<String, Widget> _connectionTestStates;
  late String _currentConnectionTestState;

  @override
  void initState() {
    super.initState();
    _connectionTestStates = {
      'notTesting': EzButton(
        onPressed: () async {
          setState(() => _currentConnectionTestState = 'testing');

          if (await api.isConnected()) {
            setState(() => _currentConnectionTestState = 'success');
          } else {
            setState(() => _currentConnectionTestState = 'failed');
          }

          Future.delayed(
            const Duration(seconds: 3),
            () => setState(() => _currentConnectionTestState = 'notTesting'),
          );
        },
        child: const EzText(
          'Test connection',
          fontSize: 20,
        ),
      ),
      'testing': Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: Globals.ctp.blue,
        ),
      ),
      'failed': const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: XMark(),
          ),
          EzText('Failed!'),
        ],
      ),
      'success': const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Check(),
          ),
          EzText('Connected!'),
        ],
      ),
    };
    _currentConnectionTestState = 'notTesting';
  }

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
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 6, left: 6, bottom: 12),
              child: EzText('Ollama API', fontSize: 32, bold: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: EzTextField(
              disableSubmitButton: true,
              hintText: 'Ollama Base URL (Required)',
              onChanged: (text) {
                Globals.prefs.setString('baseUrl', text);
                Globals.baseUrl = text;
              },
              defaultValue: Globals.baseUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: EzTextField(
              disableSubmitButton: true,
              hintText: 'Ollama API Key (Optional)',
              onChanged: (text) {
                Globals.prefs.setString('apiKey', text);
                Globals.apiKey = text;
              },
              obscureText: true,
              defaultValue: Globals.apiKey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: 200,
              height: 50,
              child: _connectionTestStates[_currentConnectionTestState]!,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 6, left: 6, top: 32),
              child: EzText('Personalization', fontSize: 32, bold: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(children: <Widget>[
              const EzText('Catppuccin Theme: ', fontSize: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  child: Dropdown(
                    items: const ['Latte', 'Frappé', 'Macchiato', 'Mocha'],
                    defaultItem: Globals.prefs.getString('theme') ?? 'Mocha',
                    onChanged: (item) {
                      Globals.prefs.setString('theme', item);
                      Globals.reloadGlobals();
                      RerenderWidget.rerenderApp(context);
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
