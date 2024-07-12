import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Image.asset(
              'images/gom_profile.jpeg',
              width: 48,
              height: 48,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 30,
          )
        ],
      ),
    );
  }
}
