import 'package:flutter/material.dart';
import 'package:user_list_sample/src/set_state/user_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserListPageSetState(),
                    ),
                  );
                },
                child: Text('SetState 상태관리')),
            ElevatedButton(onPressed: () {}, child: Text('Getx 상태관리')),
            ElevatedButton(onPressed: () {}, child: Text('Extends 상태관리')),
            ElevatedButton(onPressed: () {}, child: Text('copyWith 상태관리')),
          ],
        ),
      ),
    );
  }
}
