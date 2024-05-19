import 'package:flutter/material.dart';

class Message {
  Message({
    required this.username,
    this.content,
    required this.pfp,
    this.error,
  });

  String username;
  String? content;
  Widget pfp;
  bool? error;
}
