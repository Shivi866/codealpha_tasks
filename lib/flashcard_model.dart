import 'package:flutter/material.dart';
import 'flashcard.dart'; // Apni model file ko import karein

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FlashcardScreen());
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  // Yahan apni list initialize karein
  List<Flashcard> flashcards = [
    Flashcard(
      id: 1,
      question: "Flutter kya hai?",
      answer: "Ek UI toolkit hai.",
    ),
    Flashcard(
      id: 2,
      question: "Dart kya hai?",
      answer: "Ek programming language hai.",
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flashcard App")),
      body: Center(child: Text(flashcards[currentIndex].question)),
    );
  }
}
