import 'package:flutter/material.dart';

void main() {}

String sayHello(String name) {
  return 'Hello $name nice to meet you!';
}

String sayHello1(String name) => 'Hello $name nice to meet you!';

num plus(num a, num b) => a + b;

String sayHello2({
  required String name,
  required int age,
  required String country,
}) {
  return 'Hello, $name, you are $age, and you come from $country';
}

String sayHello4(
  String name,
  int age,
  String country,
) =>
    'Hello, $name, you are $age, and you come from $country';

String sayHello5(String name, int age, [String? country = 'korea']) =>
    'Hello, $name, you are $age, and you come from $country';

String capitalizeName(String name) => name.toUpperCase();

String capitalizeName1(String? name) => name?.toUpperCase() ?? "ANON";

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

typedef ListOfInts = List<int>;

class Player {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  Player.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        xp = json["xp"],
        team = json["team"];

  void sayHello() {
    print('Hi my name is $name');
  }

  void walk() {}
}

enum Team { red, blue }

enum XPLevel {
  beginner,
  medium,
  pro,
}

// abstract class Human {
//   void walk();
// }

class Human {
  final String name;

  Human(this.name);

  void sayHello() {
    print('Hi my name is $name');
  }
}
