import 'package:flutter/material.dart';
import 'package:clone_challenge/views/mainHome.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenge!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MainHome(),
      ),
    );
  }
}
