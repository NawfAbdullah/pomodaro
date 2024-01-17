import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffFFF1DC)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Pomodaro',
              style: TextStyle(
                  color: Color(0xff6EDA6B), decoration: TextDecoration.none),
            ),
            Image(
              image: AssetImage('images/tomato.png'),
              width: 200,
              height: 200,
            ),
            Text('10:00')
          ]),
    );
  }
}
