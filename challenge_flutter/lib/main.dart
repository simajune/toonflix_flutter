import 'package:flutter/material.dart';

mixin class Strong {
  final double strengthLevel = 1500.99;
}

mixin class QuickRunner {
  void runQuick() {
    print('ruuuuuuuuun');
  }
}

mixin class Tall {
  final double height = 1.99;
}

enum Team { red, blue }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  Player({
    required this.team,
    required String name,
  });
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {}

Stream<int> counterStream(int max) async {}
