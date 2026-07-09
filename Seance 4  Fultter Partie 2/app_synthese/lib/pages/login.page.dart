import 'package:flutter/material.dart';
import 'package:app_synthese/pages/tictactoe.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  void connect() {
    final username = userController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Missing Information'),
          content: const Text('Please enter a valid username and a password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TicTacToePage(player: username),
        ),
      );
      userController.text = "";
      passwordController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
        child:
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: screenWidth*0.75,
            height: screenHeight*0.75,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: connect,
                    child: const Text('Se connecter'))
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}