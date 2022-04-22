import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(const Magic8BollApp());
}

class Magic8BollApp extends StatefulWidget {
  const Magic8BollApp({Key? key}) : super(key: key);

  @override
  _Magic8BollAppState createState() => _Magic8BollAppState();
}

class _Magic8BollAppState extends State<Magic8BollApp> {
  List answers = [
    'Да',
    'Нет',
    'Возможно',
    'Никаких сомнений',
    'Не стоит',
    'Звезды говорят тебе да'
  ];

  int answerNumber = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        answerNumber = Random().nextInt(answers.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        appBar: AppBar(
          title: Text(
            'Спроси меня',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              answerNumber = Random().nextInt(answers.length);
            });
          },
          child: Stack(
            children: [
              Center(
                child: Image(
                    image: AssetImage(
                  'assets/magic.png',
                )),
              ),
              Center(
                child: Container(
                  width: 100,
                  child: Text(
                    answers[answerNumber],
                    style: TextStyle(color: Colors.limeAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
