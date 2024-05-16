import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/appbar.dart';

class EzScaffold extends StatelessWidget {
  const EzScaffold(
      {super.key, this.body, this.noAppBar, this.appBar, this.centerAppBar});

  final Widget? body;
  final bool? noAppBar;
  final Widget? appBar;
  final bool? centerAppBar;

  @override
  Widget build(BuildContext context) {
    if (noAppBar ?? false) {
      return Scaffold(
        backgroundColor: Globals.ctp.base,
        body: Padding(padding: const EdgeInsets.all(12), child: body),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Globals.ctp.text),
        ),
      );
    }

    if (appBar != null) {
      return Scaffold(
        backgroundColor: Globals.ctp.base,
        body: Padding(padding: const EdgeInsets.all(12), child: body),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Globals.ctp.text),
          title: appBar,
          centerTitle: centerAppBar,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Globals.ctp.base,
      body: Padding(padding: const EdgeInsets.all(12), child: body),
      appBar: const EzAppBar(),
    );
  }
}
