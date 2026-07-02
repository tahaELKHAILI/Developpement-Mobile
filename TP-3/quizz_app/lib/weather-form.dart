import 'package:flutter/material.dart';
import './weather.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  // Initialized with an empty string to support modern Dart null-safety
  String city = "";
  TextEditingController cityEditingController = TextEditingController();

  // Always dispose controllers to prevent memory leaks
  @override
  void dispose() {
    cityEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Tape a City..'),
                controller: cityEditingController,
                onChanged: (String str) {
                  setState(() {
                    city = str;
                  });
                },
                onSubmitted: (String str) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(city)),
                  );
                  cityEditingController.text = "";
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Replaced color
                foregroundColor: Colors.white,            // Replaced textColor
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Weather(city)),
                );
                cityEditingController.text = "";
              },
              child: Text('Get Weather'),
            ),
          )
        ],
      ),
    );
  }
}
