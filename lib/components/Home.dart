import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStarted = false;
  bool isBreak = false;
  String digitSeconds = '00';
  late String digitMinutes;

  int breakTime = 5;
  int workTime = 25;
  int currentSecond = 0;
  late int currentMinute;
  int sessionNumber = 1;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentMinute = workTime;
    digitMinutes = workTime.toString();
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
            if (sessionNumber < 4) {
              setState(() {
                sessionNumber++;
              });
            } else {
              setState(() {
                reset();
                sessionNumber = 1;
              });
            }
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

  void reset() {
    sessionNumber = 1;
    isStarted = false;
    currentMinute = workTime;
    currentSecond = 0;
    digitMinutes = currentMinute >= 10
        ? currentMinute.toString()
        : '0${currentMinute.toString()}';

    digitSeconds = currentSecond >= 10
        ? currentSecond.toString()
        : '0${currentSecond.toString()}';
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
            Text(
              '$digitMinutes:$digitSeconds',
              style: const TextStyle(
                  color: Color(0xff6EDA6B),
                  fontSize: 100,
                  decoration: TextDecoration.none),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Session: $sessionNumber/4',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Work Time :',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 150,
                        child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (value) => setState(() {
                                  workTime = value + 1;
                                  currentMinute = workTime;
                                  currentSecond = 0;
                                }),
                            scrollController: FixedExtentScrollController(
                                initialItem: workTime),
                            children: const [
                              Text('01'),
                              Text('02'),
                              Text('03'),
                              Text('04'),
                              Text('05'),
                              Text('06'),
                              Text('07'),
                              Text('08'),
                              Text('09'),
                              Text('10'),
                              Text('11'),
                              Text('12'),
                              Text('13'),
                              Text('14'),
                              Text('15'),
                              Text('16'),
                              Text('17'),
                              Text('18'),
                              Text('19'),
                              Text('20'),
                              Text('21'),
                              Text('22'),
                              Text('23'),
                              Text('24'),
                              Text('25'),
                              Text('26'),
                              Text('27'),
                              Text('28'),
                              Text('29'),
                              Text('30'),
                              Text('31'),
                              Text('32'),
                              Text('33'),
                              Text('34'),
                              Text('35'),
                              Text('36'),
                              Text('37'),
                              Text('38'),
                              Text('39'),
                              Text('40'),
                              Text('41'),
                              Text('42'),
                              Text('43'),
                              Text('44'),
                              Text('45'),
                              Text('46'),
                              Text('47'),
                              Text('48'),
                              Text('49'),
                              Text('50'),
                              Text('51'),
                              Text('52'),
                              Text('53'),
                              Text('54'),
                              Text('55'),
                              Text('56'),
                              Text('57'),
                              Text('58'),
                              Text('59'),
                            ]),
                      ),
                      const Text(
                        'Break Time :',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 150,
                        child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (value) => setState(() {
                                  breakTime = value + 1;
                                  currentMinute = workTime;
                                  currentSecond = 0;
                                }),
                            scrollController: FixedExtentScrollController(
                                initialItem: breakTime),
                            children: const [
                              Text('01'),
                              Text('02'),
                              Text('03'),
                              Text('04'),
                              Text('05'),
                              Text('06'),
                              Text('07'),
                              Text('08'),
                              Text('09'),
                              Text('10'),
                              Text('11'),
                              Text('12'),
                              Text('13'),
                              Text('14'),
                              Text('15'),
                              Text('16'),
                              Text('17'),
                              Text('18'),
                              Text('19'),
                              Text('20'),
                              Text('21'),
                              Text('22'),
                              Text('23'),
                              Text('24'),
                              Text('25'),
                              Text('26'),
                              Text('27'),
                              Text('28'),
                              Text('29'),
                              Text('30'),
                              Text('31'),
                              Text('32'),
                              Text('33'),
                              Text('34'),
                              Text('35'),
                              Text('36'),
                              Text('37'),
                              Text('38'),
                              Text('39'),
                              Text('40'),
                              Text('41'),
                              Text('42'),
                              Text('43'),
                              Text('44'),
                              Text('45'),
                              Text('46'),
                              Text('47'),
                              Text('48'),
                              Text('49'),
                              Text('50'),
                              Text('51'),
                              Text('52'),
                              Text('53'),
                              Text('54'),
                              Text('55'),
                              Text('56'),
                              Text('57'),
                              Text('58'),
                              Text('59'),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            isStarted = !isStarted;
                          }),
                          child: Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(50),
                                      right: Radius.circular(50)),
                                  color: Color(0xff000080)),
                              child: Text(
                                isStarted ? 'Pause' : 'Start',
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xffffffff),
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isBreak = false;
                              reset();
                            });
                          },
                          child: Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xff000080), width: 2),
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(50),
                                    right: Radius.circular(50)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: const Text(
                                'Reset',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xff000080),
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
