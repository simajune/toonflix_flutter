import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final int totalCycle;
  final int totalRound;

  const BottomWidget({
    super.key,
    required this.totalCycle,
    required this.totalRound,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '$totalCycle/4',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'ROUND',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 100,
        ),
        Column(
          children: [
            Text(
              '$totalRound/12',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'GOAL',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
