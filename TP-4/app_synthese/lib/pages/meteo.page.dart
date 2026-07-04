import 'package:flutter/material.dart';


  class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});


  @override
  State<MeteoPage> createState() => MeteoPageState();
}

class MeteoPageState extends State<MeteoPage> {
    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
      );
  }
}
