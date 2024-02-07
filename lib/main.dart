import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Computer Hardware Quiz'),
        ),
        body: QuizScreen(),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // ข้อคำถามและเฉลย
  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'CPU ย่อมาจากคำว่าอะไร?',
      'answers': ['Central Processing Unit', 'Computer Personal Unit', 'Central Power Unit', 'Computer Processing Unit'],
      'correctAnswer': 'Central Processing Unit',
    },
    {
      'questionText': 'RAM ย่อมาจากคำว่าอะไร?',
      'answers': ['Random Access Memory', 'Read Access Memory', 'Randomized Advanced Memory', 'Read Advanced Memory'],
      'correctAnswer': 'Random Access Memory',
    },
    {
      'questionText': 'GPU ย่อมาจากคำว่าอะไร?',
      'answers': ['General Processing Unit', 'Graphics Processing Unit', 'Gaming Processing Unit', 'Global Processing Unit'],
      'correctAnswer': 'Graphics Processing Unit',
    },
    {
      'questionText': 'ชนิดของหน่วยความจำที่ใช้งานในการเก็บข้อมูลถาวรคือ?',
      'answers': ['RAM', 'ROM', 'CPU', 'GPU'],
      'correctAnswer': 'ROM',
    },
    {
      'questionText': 'ที่เก็บข้อมูลในรูปแบบอุปกรณ์อิเล็กทรอนิกส์ที่อ่านเขียนได้มีชื่อว่าอะไร?',
      'answers': ['SSD', 'HDD', 'USB', 'DVD'],
      'correctAnswer': 'SSD',
    },
    {
      'questionText': 'อุปกรณ์ที่ใช้สื่อสารระหว่างคอมพิวเตอร์และเครือข่ายอินเตอร์เน็ตคือ?',
      'answers': ['Router', 'Modem', 'Switch', 'NIC (Network Interface Card)'],
      'correctAnswer': 'NIC (Network Interface Card)',
    },
    {
      'questionText': 'ที่เก็บข้อมูลในรูปแบบอุปกรณ์ที่ใช้แม่เหล็กสำหรับการเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นใน?',
      'answers': ['RAM', 'ROM', 'CPU', 'GPU'],
      'correctAnswer': 'ROM',
    },
    {
      'questionText': 'ที่เก็บข้อมูลในรูปแบบอุปกรณ์ที่ใช้แม่เหล็กสำหรับการเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นในการใช้แม่เหล็กเพื่อเก็บข้อมูลเช่นใน?',
      'answers': ['RAM', 'ROM', 'CPU', 'GPU'],
      'correctAnswer': 'ROM',
    },
    {
      'questionText': 'ที่เก็บข้อมูลในรูปแบบอุปกรณ์ที่ใช้แม่เหล็กสำหรับการเก็บข้อมูลเช่นใน?',
      'answers': ['RAM', 'ROM', 'CPU', 'GPU'],
      'correctAnswer': 'ROM',
    },
    {
      'questionText': 'ที่เก็บข้อมูลในรูปแบบอุปกรณ์ที่ใช้แม่เหล็กสำหรับการเก็บข้อมูลเช่นใน?',
      'answers': ['RAM', 'ROM', 'CPU', 'GPU'],
      'correctAnswer': 'ROM',
    },
  ];

  int questionIndex = 0;
  int score = 0;

  void answerQuestion(String selectedAnswer) {
    String correctAnswer = questions[questionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return questionIndex < questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[questionIndex]['questionText'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                return ElevatedButton(
                  onPressed: () => answerQuestion(answer),
                  child: Text(answer),
                );
              }).toList(),
            ],
          )
        : Center(
            child: Text(
              'คุณได้คะแนน $score จาก ${questions.length}',
              style: TextStyle(fontSize: 24),
            ),
          );
  }
}
