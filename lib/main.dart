import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: QuoteGenerator()),
);

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  State<QuoteGenerator> createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final List<String> quotes = [
    "Be yourself; everyone else is already taken— Oscar Wilde",
    "It is never too late to be what you might have been— George Eliot",
    "Not all those who wander are lost— J. R. R. Tolkien",
    "There is no friend as loyal as a book— Ernest Hemingway",
    "A room without books is like a body without a soul— Marcus Tullius Cicero",
    "The only way to do great work is to love what you do— Steve Jobs",
    "Success is not final, failure is not fatal: it is the courage to continue that counts— Winston Churchill",
    "The future depends on what you do today— Mahatma Gandhi",
    "Dream, dream, dream. Dreams transform into thoughts and thoughts result in action— A. P. J. Abdul Kalam",
    "Education is the most powerful weapon which you can use to change the world— Nelson Mandela",
    "Happiness depends upon ourselves— Aristotle",
    "The journey of a thousand miles begins with one step— Lao Tzu",
    "The only limit to our realization of tomorrow is our doubts of today— Franklin D. Roosevelt",
    "Life is what happens when you're busy making other plans— John Lennon",
    "Believe you can and you're halfway there— Theodore Roosevelt",
    "Everything you've ever wanted is on the other side of fear— George Addair",
    "The best way to predict the future is to create it— Peter Drucker",
    "Strive not to be a success, but rather to be of value— Albert Einstein",
    "The secret of getting ahead is getting started— Mark Twain",
    "Do what you can, with what you have, where you are— Theodore Roosevelt",
  ];

  String currentQuote = "Click the button to get inspired!";

  void updateQuote() {
    setState(() {
      currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Smooth Deep Purple to Blue Gradient
          gradient: LinearGradient(
            colors: [Color(0xFF481E73), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Glassmorphism Card
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Stylish Button
                ElevatedButton.icon(
                  onPressed: updateQuote,
                  icon: const Icon(Icons.auto_awesome, color: Colors.amber),
                  label: const Text("Generate Quote"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF481E73),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
