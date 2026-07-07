import 'package:flutter/material.dart';
import 'flashcard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: FlashcardScreen(),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final List<Flashcard> _flashcards = [
    Flashcard(
      question: "What is the purpose of the static keyword in Java? 🏗️",
      answer:
          "The static keyword is used for memory management. It makes a variable or method belong to the class rather than a specific object, allowing it to be accessed without creating an instance of the class.",
    ),
    Flashcard(
      question: "What is 'Inheritance' in Java? 🧬",
      answer:
          "Inheritance is a mechanism where one class (child) acquires the properties and methods of another class (parent). It is achieved using the extends keyword.",
    ),
    Flashcard(
      question: "What is Polymorphism? 🎭",
      answer:
          "Polymorphism means 'many forms.' In Java, it occurs in two ways: Compile-time (Method Overloading) and Runtime (Method Overriding).",
    ),
    Flashcard(
      question: "Why do we use try-catch blocks? 🛡️",
      answer:
          "To handle runtime errors (exceptions) gracefully so that the program doesn't crash unexpectedly and continues to run.",
    ),
    Flashcard(
      question: "What is the difference between throw and throws? 🚀",
      answer:
          "throw is used inside a method to explicitly trigger an exception, while throws is used in a method signature to declare that the method might throw a specific exception.",
    ),
    Flashcard(
      question: "What is the difference between ArrayList and LinkedList? 📋",
      answer:
          "ArrayList is faster for accessing data (dynamic array), while LinkedList is faster for adding or removing elements (doubly-linked list).",
    ),
    Flashcard(
      question: "How does a HashMap work? 🔑",
      answer:
          "A HashMap stores data in 'Key-Value' pairs. It uses a technique called hashing to allow for very fast data retrieval and searching.",
    ),
    Flashcard(
      question:
          "What is the difference between an Interface and an Abstract Class? ⚖️",
      answer:
          "An Abstract Class can have both abstract and non-abstract methods (with implementation) and state (variables). An Interface is a blueprint that defines what a class should do, traditionally containing only method declarations.",
    ),
    Flashcard(
      question: "Why are Strings considered 'immutable' in Java? 🧊",
      answer:
          "Strings are immutable for security and memory efficiency. By using the String Pool, Java can share string instances, which would be impossible if strings could be modified after creation.",
    ),
  ];

  int _currentIndex = 0;
  bool _isFront = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text(
          "Flashcard Quiz 🧠",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setState(() => _isFront = !_isFront),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutBack,
              width: 320,
              height: 220,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: _isFront ? Colors.deepPurple : Colors.teal,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: Colors.black26,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _isFront
                        ? _flashcards[_currentIndex].question
                        : _flashcards[_currentIndex].answer,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                onPressed: () => setState(() {
                  _currentIndex =
                      (_currentIndex - 1 + _flashcards.length) %
                      _flashcards.length;
                  _isFront = true;
                }),
                icon: Icon(Icons.arrow_back, color: Colors.white),
                label: Text("Previous", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                onPressed: () => setState(() {
                  _currentIndex = (_currentIndex + 1) % _flashcards.length;
                  _isFront = true;
                }),
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                label: Text("Next", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
