import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String numbers;

  const CardWidget({
    super.key,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24,
        ),
        child: Text(
          numbers,
          style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange),
        ),
      ),
    );
  }
}
