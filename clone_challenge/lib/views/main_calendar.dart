import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainCalendar extends StatelessWidget {
  final List<int> days = [17, 18, 19, 20, 21, 22, 23, 24, 25, 26];

  MainCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MONDAY 16',
            style: TextStyle(fontSize: 18),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  'TODAY',
                  style: TextStyle(fontSize: 52.0),
                ),
                Container(
                  width: 20,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                for (var day in days)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$day',
                      style: TextStyle(
                          fontSize: 36, color: CupertinoColors.systemGrey),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
