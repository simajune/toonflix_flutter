import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player {
  String name;

  Player({required this.name});
}

void main() {
  var taejune = Player(name: "taejune");
  runApp(App());
}



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO : impletment build
    // throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: false,
          title: Text('Hello Fultter!'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}
