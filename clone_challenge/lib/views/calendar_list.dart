import 'package:clone_challenge/models/calendar_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  final CalendarCardModel cardModel;

  CalendarCard({
    required CalendarCardModel this.cardModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: cardModel.color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    '${cardModel.startHour}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${cardModel.startMin}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 10,
                    color: Colors.black,
                  ),
                  Text(
                    '${cardModel.endHour}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${cardModel.endMin}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardModel.title,
                    style: const TextStyle(fontSize: 58.0, color: Colors.black),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var partner in cardModel.partners)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              partner,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
