import 'package:flutter/material.dart';
import 'package:app_synthese/widgets/mydrawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page ..', style: TextStyle(fontSize: 22, color: Colors.deepOrange)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Démo navigation (Login → Tic Tac Toe)'),
            ),
          ],
        ),
      ),
    );
  }
}