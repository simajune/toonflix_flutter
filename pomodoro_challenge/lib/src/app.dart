import 'dart:async';

import 'package:flutter/material.dart';

import 'bottom_widget.dart';
import 'card_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

enum TimerOptions { fifteen, twenty, twentyFive, thirty, thirtyFive }

enum ProgressState { stop, running, rest }

class _AppState extends State<App> {
  late Timer _timer;
  late List<bool> isSelected;
  final List<(TimerOptions, String, int)> timerOptionsList = [
    (TimerOptions.fifteen, '15', 15),
    (TimerOptions.fifteen, '20', 20),
    (TimerOptions.fifteen, '25', 25),
    (TimerOptions.fifteen, '30', 30),
    (TimerOptions.fifteen, '35', 35),
  ];
  int totalCycle = 0;
  int totalRound = 0;
  ProgressState state = ProgressState.stop;
  // bool isRunning = false;
  int totalSeconds = 1500;

  @override
  initState() {
    isSelected = [
      false,
      false,
      true,
      false,
      false,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      'POMOTIMER',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardWidget(
                    numbers: formatMinute(totalSeconds),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        fontSize: 56,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CardWidget(
                    numbers: formatSecond(totalSeconds),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ToggleButtons(
                    fillColor: Colors.red,
                    isSelected: isSelected,
                    onPressed: toggleSelect,
                    children: [
                      for (var option in timerOptionsList)
                        Text(
                          option.$2,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ],
                  )),
              Expanded(
                child: SizedBox(
                  child: Visibility(
                    visible: state == ProgressState.rest,
                    child: Center(
                      child: Text(
                        '휴식 중입니다.',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  state == ProgressState.running
                      ? onPausePressed()
                      : onStartPressed();
                },
                icon: Icon(
                  state == ProgressState.running
                      ? Icons.pause_circle
                      : Icons.play_circle,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Visibility(
                    visible: state == ProgressState.running,
                    child: IconButton(
                      onPressed: () {
                        onResetPressed();
                      },
                      icon: const Icon(
                        Icons.refresh_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              BottomWidget(
                totalCycle: totalCycle,
                totalRound: totalRound,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleSelect(value) {
    if (state == ProgressState.stop) {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = false;
      }
      isSelected[value] = true;
      setState(() {
        var option = timerOptionsList[isSelected.indexOf(true)];
        totalSeconds = option.$3 * 60;
      });
    }
  }

  void onStartPressed() {
    if (state == ProgressState.stop) {
      state = ProgressState.running;
      _timer = Timer.periodic(
        const Duration(
          // seconds: 1,
          milliseconds: 6,
        ),
        onTick,
      );
    }
  }

  void onPausePressed() {
    if (state == ProgressState.running) {
      _timer.cancel();
      setState(() {
        state = ProgressState.stop;
      });
    }
  }

  void onResetPressed() {
    setState(() {
      state = ProgressState.stop;
      var option = timerOptionsList[isSelected.indexOf(true)];
      totalSeconds = option.$3 * 60;
    });
    _timer.cancel();
  }

  String formatMinute(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 4);
  }

  String formatSecond(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(5, 7);
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalCycle++;
        if (totalCycle == 4) {
          totalCycle = 0;
          totalRound++;
          totalSeconds = 300;
          state = ProgressState.rest;
        } else {
          if (state == ProgressState.rest) {
            print('rest');
            totalCycle = 0;
          }
          state = ProgressState.stop;
          var option = timerOptionsList[isSelected.indexOf(true)];
          totalSeconds = option.$3 * 60;
          timer.cancel();
        }
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }
}
