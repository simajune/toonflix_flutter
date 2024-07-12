import 'package:clone_challenge/models/calendar_card_model.dart';
import 'package:clone_challenge/views/main_calendar.dart';
import 'package:flutter/material.dart';

import 'calendar_list.dart';
import 'main_header.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            const SizedBox(
              height: 24,
            ),
            MainCalendar(),
            for (var card in testModel)
              CalendarCard(
                cardModel: CalendarCardModel(
                    title: card.title,
                    startHour: card.startHour,
                    startMin: card.endHour,
                    endHour: card.endMin,
                    endMin: card.endMin,
                    color: card.color,
                    partners: [
                      'ALEX',
                      'HELENA',
                      'NANA',
                    ]),
              ),
          ],
        ),
      ),
    );
  }
}

List<CalendarCardModel> testModel = [
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
      color: Colors.purple),
  CalendarCardModel(
      startHour: 15,
      startMin: 00,
      endHour: 16,
      endMin: 30,
      title: 'WEEKLY\nPLANNING',
      partners: ['ALEX', 'HELENA', 'NANA', 'MARK'],
      color: Colors.green),
];
