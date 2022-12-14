// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        fontFamily: "Times",
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.blue[200],
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 28,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 1.0,
              )
            ],
            fontSize: 48,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Times",
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 1.0,
              )
            ],
            fontSize: 24,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

/// Home page for the application.
/// This page displays static contents:
/// - Greeting text ("Тестовий додаток")
/// - AppBar with the title
/// - Floating button wich navigates us to the second page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.center,
          "Слава Україні!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 180),
              child: Text(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
                "Тестовий додаток",
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                label: Text(
                  "Почнімо!",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Second page of the app, which changes the background color when clicked.
/// For this I use StatefullWidget and InkWell widget in it.
/// Text "Hi there!" changes the color as well
class SecondPage extends StatefulWidget {
  /// Constructor of the second page
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String text = "Hello there!";
  double defFontSize = 64.0;
  Color randBackgroundColor = Colors.amber;
  Color randTextColor = Colors.blue;
  Color randButtonColor = Colors.green;

  Color _generateColor() {
    const int alpha = 255;
    final rand = Random();
    final int red = rand.nextInt(256);
    final int green = rand.nextInt(256);
    final int blue = rand.nextInt(256);

    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;

    return Material(
      color: randBackgroundColor,
      child: InkWell(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                backgroundColor: randButtonColor,
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 180.0, 0, 0),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    for (int i = 0; i < text.length; i++)
                      TextSpan(
                        text: text[i],
                        style: style?.copyWith(
                          color: _generateColor(),
                          fontFamily: 'Western',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            randBackgroundColor = _generateColor();
            randTextColor = _generateColor();
            randButtonColor = _generateColor();
          });
        },
      ),
    );
  }
}
