import 'package:flutter/material.dart';
import 'package:ollama_app/widgets/ez/ez_text.dart';
import 'package:ollama_app/widgets/icons/bars3.dart';
import 'package:ollama_app/widgets/icons/cog6tooth.dart';

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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Bars3(),
          ),
          const EzText('Ollama', color: Colors.white, bold: true, fontSize: 28),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            icon: const Cog6Tooth(),
          ),
        ],
      ),
    );
  }
}
