import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더하기 예제'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Getx 더하기')),
            ElevatedButton(onPressed: () {}, child: Text('Cubit 더하기')),
            ElevatedButton(onPressed: () {}, child: Text('Bloc 더하기')),
          ],
        ),
      ),
    );
  }
}
