import 'package:chatbot/parameters/global.parameters.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      routes: GlobalParameters.routes,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}