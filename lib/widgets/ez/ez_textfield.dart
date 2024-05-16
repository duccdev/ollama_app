import 'package:flutter/material.dart';
import 'package:ollama_app/constants.dart';
import 'package:ollama_app/widgets/icons/arrowup.dart';

typedef OnSubmittedCallback = void Function(String text);

class EzTextField extends StatefulWidget {
  const EzTextField({super.key, required this.onSubmitted});
  final OnSubmittedCallback onSubmitted;

  @override
  State<EzTextField> createState() => _EzTextFieldState();
}

class _EzTextFieldState extends State<EzTextField> {
  bool _sendButtonDisabled = true;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      if (_controller.text.trim().isNotEmpty) {
        _sendButtonDisabled = false;
        return;
      }

      _sendButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(9999),
        right: Radius.circular(9999),
      ),
    );

    return SizedBox(
      height: 48,
      child: TextField(
        controller: _controller,
        style: TextStyle(color: ctp.text, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          filled: true,
          fillColor: ctp.surface2,
          border: border,
          focusedBorder: border,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          hintText: 'Message Ollama',
          hintStyle: TextStyle(
            color: ctp.overlay2,
            fontWeight: FontWeight.w600,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4),
            child: IconButton.filled(
              icon: ArrowUp(color: _sendButtonDisabled ? ctp.text : ctp.base),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _sendButtonDisabled ? ctp.surface0 : ctp.green,
                ),
              ),
              onPressed: _sendButtonDisabled
                  ? null
                  : () => widget.onSubmitted(_controller.text),
            ),
          ),
        ),
        cursorColor: ctp.lavender,
      ),
    );
  }
}
