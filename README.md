# todey

A new Flutter project.

this project is my official first flutter app release.
In Todoey application, i used provider package for my state management and sqflite for persistent data.

combining these two packages wasn't easy but I did it and here you can check it out. please do make corrections and learn if you can.

Thank you

this code below is an AI generated simplified version of 4pic1word.

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4 Pics 1 Word',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
  ];

  List<String> words = [
    'Apple',
    'Banana',
    'Cat',
    'Dog',
    'Elephant',
    'Fish',
    'Giraffe',
    'Horse',
  ];

  String currentWord;
  List<String> currentImages;
  TextEditingController inputController = TextEditingController();
  bool isCorrectAnswer = false;

  @override
  void initState() {
    super.initState();
    generateRandomPuzzle();
  }

  void generateRandomPuzzle() {
    Random random = Random();

    // Select a random word from the word list
    currentWord = words[random.nextInt(words.length)];

    // Shuffle the image paths
    currentImages = List.from(imagePaths)..shuffle();

    setState(() {
      isCorrectAnswer = false;
      inputController.text = '';
    });
  }

  void checkAnswer() {
    String userInput = inputController.text.toLowerCase().trim();

    setState(() {
      isCorrectAnswer = userInput == currentWord.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4 Pics 1 Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: currentImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(currentImages[index]);
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                labelText: 'Enter the word',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('Check Answer'),
            ),
            SizedBox(height: 20.0),
            if (isCorrectAnswer)
              Text(
                'Correct Answer!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: generateRandomPuzzle,
              child: Text('Next Puzzle'),
            ),
          ],
        ),
      ),
    );
  }
}
