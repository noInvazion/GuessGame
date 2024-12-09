// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "dart:math";
import "package:flutter/material.dart";

void main() {
  runApp(GuessGame());
}

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  TextEditingController userInput = TextEditingController();

  int randomNumber = Random().nextInt(11);
  String congratMsg = "";

  void generateRandomNumber() {
    randomNumber = Random().nextInt(11);
  }

  void checkGuess() {
    setState(() {
      if (int.parse(userInput.text) == randomNumber) {
        congratMsg =
            "You guessed the number right! The number was indeed $randomNumber";
        generateRandomNumber();
      } else {
        congratMsg = "Failed to guess the correct number. Try again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text(
            "Model Of Guess Game",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Guess a number",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                TextField(
                  controller: userInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Guess a number from 1 - 10..",
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: checkGuess,
                  child: Text("Guess"),
                  style: ButtonStyle(),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(congratMsg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
