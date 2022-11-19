import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
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
/// This Statless widget will return Scaffold
/// with various elements
class Home extends StatelessWidget {
  // in stateless widget state of the app doesnt change
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
            child: Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              "Тестовий додаток",
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 58.0, 0, 0),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.blue,
              onPressed: null,
              label: Text(
                "Почнімо!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/flag.png"),
            ),
          ),
        ],
      ),
    );
  }
}
