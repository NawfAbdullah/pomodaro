import 'package:flutter/material.dart';
import 'package:pomodaro/components/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomoadaro',
      home: Home(),
    );
  }
}
