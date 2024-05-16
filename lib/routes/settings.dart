import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/dropdown.dart';
import 'package:ollama_app/widgets/ez/scaffold.dart';
import 'package:ollama_app/widgets/ez/text.dart';
import 'package:ollama_app/widgets/ez/textfield.dart';
import 'package:ollama_app/widgets/icons/cog6tooth.dart';
import 'package:ollama_app/widgets/rerender_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  List<Widget> padChildren(List<Widget> children) {
    for (int i = 0; i < children.length; i++) {
      children[i] = Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: children[i],
      );
    }

    return children;
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
        children: padChildren(
          <Widget>[
            const EzTextField(
              disableSubmitButton: true,
              hintText: 'Ollama Base URL (Required)',
            ),
            const EzTextField(
              disableSubmitButton: true,
              hintText: 'Ollama API Key (Optional)',
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
      ),
    );
  }
}
