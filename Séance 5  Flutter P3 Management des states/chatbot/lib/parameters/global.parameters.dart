import 'package:flutter/material.dart';
import 'package:chatbot/pages/home.page.dart';
import 'package:chatbot/pages/chat.page.dart';


class GlobalParameters {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/chat': (context) => const ChatPage(),
  };
}