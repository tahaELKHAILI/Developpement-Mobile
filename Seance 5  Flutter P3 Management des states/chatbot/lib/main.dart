import 'package:chatbot/parameters/global.parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

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