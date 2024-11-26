// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random rand = new Random();

  TextEditingController textctrl = TextEditingController();

  void checkGuess(){
    int correctGuess = rand.nextInt(11);
    int userGuess = int.parse(textctrl.text);

    if (userGuess == correctGuess){
      String winMessage = "You guessed the correct answer!";
      textctrl.text = winMessage;
    } else {
      String lossMessage = "You lost! The correct number is $correctGuess";
      textctrl.text = lossMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Guess The Number"),
          backgroundColor: Colors.green[700],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Guess the number ranging from 1 to 10"),
                TextField(
                  controller: textctrl,
                  decoration: InputDecoration(
                    hintText: "Guess a number ( 1 - 10)",
                    hintStyle: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(onPressed: checkGuess,
                child: Text("Guess"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
