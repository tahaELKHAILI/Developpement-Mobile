import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [
              Color.fromARGB(255, 105, 70, 189),
              Color.fromARGB(255, 180, 160, 220),
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),

        ),


        child: SafeArea(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [


              // AI Icon
              Container(

                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(

                  color: Colors.white,

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withOpacity(0.2),

                      blurRadius: 15,

                      offset: const Offset(0, 8),

                    ),

                  ],

                ),


                child: const Icon(

                  Icons.smart_toy,

                  size: 80,

                  color: Color.fromARGB(255, 105, 70, 189),

                ),

              ),



              const SizedBox(height: 40),



              const Text(

                "Welcome to AI Chat",

                style: TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                  color: Colors.white,

                ),

              ),



              const SizedBox(height: 15),



              const Padding(

                padding: EdgeInsets.symmetric(horizontal: 40),

                child: Text(

                  "Your personal AI assistant ready to answer questions, help with ideas, and chat with you.",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 17,

                    color: Colors.white70,

                    height: 1.5,

                  ),

                ),

              ),



              const SizedBox(height: 45),



              ElevatedButton(

                onPressed: () => Navigator.pushNamed(context, '/chat'),


                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.white,

                  foregroundColor: Color.fromARGB(255, 105, 70, 189),

                  padding: const EdgeInsets.symmetric(

                    horizontal: 45,

                    vertical: 16,

                  ),


                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(30),

                  ),


                  elevation: 8,

                ),



                child: const Row(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    Text(

                      "Start Chatting",

                      style: TextStyle(

                        fontSize: 18,

                        fontWeight: FontWeight.bold,

                      ),

                    ),


                    SizedBox(width: 10),


                    Icon(Icons.arrow_forward),

                  ],

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}