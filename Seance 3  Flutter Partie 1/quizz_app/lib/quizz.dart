import 'package:flutter/material.dart';

class Quizz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quizz> {
  int currentQuestion = 0;
  int score = 0;

  // Added 5 realistic general knowledge and mobile dev questions
  final quiz = [
    {
      'title': 'What programming language is used to build Flutter apps',
      'answers': [
        {'answer': 'Kotlin', 'correct': false},
        {'answer': 'Java', 'correct': false},
        {'answer': 'Dart', 'correct': true},
        {'answer': 'Swift', 'correct': false},
      ]
    },
    {
      'title': 'Which planet is known as the Red Planet',
      'answers': [
        {'answer': 'Venus', 'correct': false},
        {'answer': 'Mars', 'correct': true},
        {'answer': 'Jupiter', 'correct': false},
        {'answer': 'Saturn', 'correct': false},
      ]
    },
    {
      'title': 'What does API stand for',
      'answers': [
        {'answer': 'Application Programming Interface', 'correct': true},
        {'answer': 'App Program Integration', 'correct': false},
        {'answer': 'Advanced Protocol Internet', 'correct': false},
        {'answer': 'Automated Programming Industry', 'correct': false},
      ]
    },
    {
      'title': 'Which function is the starting entry point for any Flutter app',
      'answers': [
        {'answer': 'startApp()', 'correct': false},
        {'answer': 'build()', 'correct': false},
        {'answer': 'runApp()', 'correct': false},
        {'answer': 'main()', 'correct': true},
      ]
    },
    {
      'title': 'What is the capital city of France',
      'answers': [
        {'answer': 'London', 'correct': false},
        {'answer': 'Berlin', 'correct': false},
        {'answer': 'Paris', 'correct': true},
        {'answer': 'Rome', 'correct': false},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.orange,
      ),
      body: (this.currentQuestion >= quiz.length)
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score : ${(score / quiz.length * 100).round()} %',
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                setState(() {
                  currentQuestion = 0;
                  score = 0;
                });
              },
              child: Text(
                'Restart ...',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          ],
        ),
      )
          : ListView(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'Question : ${currentQuestion + 1}/${quiz.length}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              '${quiz[currentQuestion]['title']} ?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>).map((answer) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: () {
                  setState(() {
                    if (answer['correct'] == true) ++score;
                    ++this.currentQuestion;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      answer['answer'] as String,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
