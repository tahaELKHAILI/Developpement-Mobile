import 'package:flutter/material.dart';
import './quizz.dart';
import './weather-form.dart'; // Verified import path matching your file layout

// 1. Clean root entry point architecture
void main() => runApp(const MyRootApp());

class MyRootApp extends StatelessWidget {
  const MyRootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App Layout',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MyApp(), // 2. This safely places MyApp under MaterialApp's Context tree
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First App'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'First Flutter App',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.white]),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Quiz',
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop(); // Closes drawer context layer safely
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizz()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Weather',
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop(); // Closes drawer context layer safely
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherForm(), // Correctly opens the form
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
