import 'dart:ui';

import 'package:flutter/material.dart';

class CalendarCardModel {
  final int startHour;
  final int startMin;
  final int endHour;
  final int endMin;
  final String title;
  final List<String> partners;
  final Color color;

  CalendarCardModel({
    required this.startHour,
    required this.startMin,
    required this.endHour,
    required this.endMin,
    required this.title,
    required this.partners,
    required this.color,
  });
}

List<CalendarCardModel> textModel = [
  CalendarCardModel(
      startHour: 10,
      startMin: 30,
      endHour: 12,
      endMin: 30,
      title: 'DESIGN\nMEETING',
      partners: ['ALEX', 'HELENA', 'NANA'],
      color: Colors.blueAccent),
  CalendarCardModel(
      startHour: 12,
      startMin: 35,
      endHour: 14,
      endMin: 10,
      title: 'DAILY\nPROJECT',
      partners: ['ALEX', 'HELENA', 'NANA', 'ME', 'Ciry'],
      color: Colors.blueAccent),
  CalendarCardModel(
      startHour: 15,
      startMin: 00,
      endHour: 16,
      endMin: 30,
      title: 'WEEKLY\nPLANNING',
      partners: ['ALEX', 'HELENA', 'NANA', 'MARK'],
      color: Colors.blueAccent),
];
