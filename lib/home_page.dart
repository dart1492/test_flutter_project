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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.push<StatelessWidget>(
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
  double defFontSize = 78.0;
  Color randColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: randColor,
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Hey There!",
              style: TextStyle(
                color: _generateColor(),
                fontFamily: "Western",
                fontSize: defFontSize,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              randColor = _generateColor();
            });
          },
        ),
      ),
    );
  }
}

Color _generateColor() {
  const int alpha = 255;
  final rand = Random();
  final int red = rand.nextInt(255);
  final int green = rand.nextInt(255);
  final int blue = rand.nextInt(255);

  return Color.fromARGB(alpha, red, green, blue);
}
// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Color randColor = Colors.amber;

//     return Center(
//         child: AnimatedContainer(
//             duration: const Duration(seconds: 2),
//             color: randColor,
//             alignment: Alignment.center,
//             child: Material(child: InkWell(
//               onTap: () {
//                 setState(() {});
//               },
//             ))));
//   }
// }
