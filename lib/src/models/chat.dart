import 'package:flutter/material.dart';

class Chat extends ChangeNotifier {
  final String name;
  final String lastMessage;
  final String date;
  final bool read;

  Chat({
    this.name,
    this.lastMessage,
    this.date,
    this.read = false,
  });
}
