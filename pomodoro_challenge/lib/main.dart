import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeData.dark(),
      home: const App(),
    );
  }
}
