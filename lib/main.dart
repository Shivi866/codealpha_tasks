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
      question:
          "What is the main difference between final, finally, and finalize?🚀",
      answer:
          "final is a keyword (no change), finally is for cleanup blocks, and finalize is for garbage collection. 🧹",
    ),
    Flashcard(
      question: "Is Java a 100% Object-Oriented language? 🎯",
      answer:
          "No, because it uses primitive types (like int, boolean, double) which are not objects. 🔢⚡",
    ),
    Flashcard(
      question: "Why do we use public static void main?🧩",
      answer:
          "public (accessible everywhere), static (no object needed), void (no return), main (entry point). 🏁 🎨",
    ),
    Flashcard(
      question:
          "What is the difference between an Interface and an Abstract Class?",
      answer:
          "Abstract classes allow some code implementation; interfaces (traditionally) only define behavior contracts. 📜",
    ),
    Flashcard(
      question: "What is Polymorphism?",
      answer:
          "The ability of one object to take many forms—like using a single method name in different ways (Overloading/Overriding). 🎭",
    ),
    Flashcard(
      question: "Why use private variables?",
      answer:
          "To achieve Encapsulation—protecting your data from direct access and keeping it safe! 🔒",
    ),
    Flashcard(
      question: "ArrayList vs LinkedList?",
      answer:
          "ArrayList is faster for accessing data; LinkedList is faster for adding/deleting data. ⚡",
    ),
    Flashcard(
      question: "What is the String Pool?",
      answer:
          "A memory area that saves space by reusing String literals instead of creating duplicates. 💾",
    ),
    Flashcard(
      question: "What does the Garbage Collector do?",
      answer:
          "It automatically finds and deletes objects that are no longer being used to free up memory. 🗑️",
    ),
    Flashcard(
      question: "What is a Lambda Expression?",
      answer:
          "A short, functional way to write code without needing a full method definition. 🎯",
    ),
    Flashcard(
      question: "What is the Stream API?",
      answer:
          "A powerful tool introduced in Java 8 to process collections of data in a functional, readable way. 🌊",
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
                      fontSize: 22,
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
