import 'package:flutter/material.dart';
import 'package:ollama_app/globals.dart';
import 'package:ollama_app/widgets/ez/text.dart';

typedef OnChangedCallback = void Function(String value);

class Dropdown extends StatefulWidget {
  const Dropdown(
      {super.key,
      required this.items,
      required this.defaultItem,
      this.onChanged});

  final List<String> items;
  final String defaultItem;
  final OnChangedCallback? onChanged;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value ?? widget.defaultItem,
      items: widget.items
          .map((value) => DropdownMenuItem<String>(
                value: value,
                child: EzText(value, fontSize: 18),
              ))
          .toList(),
      dropdownColor: Globals.ctp.base,
      onChanged: (value) {
        setState(() => _value = value!);
        if (widget.onChanged != null) widget.onChanged!(value!);
      },
    );
  }
}
