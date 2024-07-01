import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isShowTitle = true;

  void toggleTitle() {
    setState(() {
      isShowTitle = !isShowTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowTitle ? MyLageTitle() : Text('nothingToSee'),
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLageTitle extends StatefulWidget {
  const MyLageTitle({
    super.key,
  });

  @override
  State<MyLageTitle> createState() => _MyLageTitleState();
}

class _MyLageTitleState extends State<MyLageTitle> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
      ),
    );
  }
}
