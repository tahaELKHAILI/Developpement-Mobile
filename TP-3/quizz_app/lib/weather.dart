import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  final String city;
  Weather(this.city);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic>? weatherData;

  void getData(String url) {
    http.get(
      Uri.parse(url),
      headers: {'accept': 'application/json'},
    ).then((resp) {
      if (resp.statusCode == 200) {
        setState(() {
          weatherData = json.decode(resp.body)['list'];
        });
      } else {
        print("API Error Status Code: ${resp.statusCode}");
      }
    }).catchError((err) {
      print("Network Error: $err");
    });
  }

  @override
  void initState() {
    super.initState();

    // 1. Extract secret key compiled from your .env file
    const apiKey = String.fromEnvironment('OPENWEATHER_KEY');

    // 2. FIXED: Correct path subdomain, forecast path parameters, and string interpolation sign ($)
    final String url = 'https://api.openweathermap.org/data/2.5/forecast?q=${widget.city}&APPID=$apiKey&units=metric';



    print("Requesting URL: $url");
    getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        backgroundColor: Colors.orange,
      ),
      body: (weatherData == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: weatherData!.length,
        itemBuilder: (context, index) {
          final item = weatherData![index];

          final int timestamp = item['dt'] ?? 0;
          final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

          final String weatherMain = item['weather'][0]['main'] ?? 'Clear';
          final double temp = (item['main']['temp'] as num).toDouble();

          return Card(
            color: Colors.deepOrangeAccent,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'images/${weatherMain.toLowerCase()}.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat('E dd/MM/yyyy').format(date),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${DateFormat('HH:mm').format(date)} | $weatherMain",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${temp.round()} °C",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
