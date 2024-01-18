import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStarted = true;
  bool isBreak = false;
  String digitSeconds = '00';
  String digitMinutes = workTime.toString();

  static int breakTime = 1;
  static int workTime = 2;
  int currentSecond = 0;
  int currentMinute = workTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isStarted) {
        if (currentMinute >= 0) {
          if (currentSecond == 0) {
            currentSecond = 59;
            currentMinute--;
          } else {
            currentSecond--;
          }
        } else {
          if (isBreak) {
            isBreak = false;
            currentSecond = 0;
            currentMinute = workTime;
          } else {
            isBreak = true;
            currentSecond = 0;
            currentMinute = breakTime;
          }
        }
        setState(() {
          digitMinutes = currentMinute >= 10
              ? currentMinute.toString()
              : '0${currentMinute.toString()}';

          digitSeconds = currentSecond >= 10
              ? currentSecond.toString()
              : '0${currentSecond.toString()}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (isBreak) ? Colors.green : const Color(0xffFFF1DC)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              isBreak ? 'Break' : 'Pomodaro',
              style: const TextStyle(
                  color: Color(0xff6EDA6B), decoration: TextDecoration.none),
            ),
            const Image(
              image: AssetImage('images/tomato.png'),
              width: 200,
              height: 200,
            ),
            Text('$digitMinutes:$digitSeconds')
          ]),
    );
  }
}
