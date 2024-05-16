import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/text.dart';
import 'package:ollama_app/widgets/icons/bars3.dart';
import 'package:ollama_app/widgets/icons/cog6tooth.dart';
import 'package:ollama_app/widgets/icons/ollama_logo.dart';

class EzAppBar extends StatefulWidget implements PreferredSizeWidget {
  const EzAppBar({super.key});

  @override
  EzAppBarState createState() => EzAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class EzAppBarState extends State<EzAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Globals.ctp.text),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Bars3(color: Globals.ctp.text),
          ),
          const Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: OllamaLogo(),
            ),
            EzText('Ollama', color: Colors.white, bold: true, fontSize: 28),
          ]),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            icon: Cog6Tooth(color: Globals.ctp.text),
          ),
        ],
      ),
    );
  }
}
