import 'package:flutter/material.dart';

void main() {
  print(sayHello2(
    name: 'tj',
    age: 38,
    country: 'Korea',
  ));
}

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
