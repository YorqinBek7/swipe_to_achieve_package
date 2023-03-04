import 'package:flutter/material.dart';
import 'package:swipe_to_achieve/swipe_to_achieve.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Swipe to Achieve',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwipeToAchieve(
          width: 150.0,
          title: 'Swipe to achievement',
          textStyle: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
          achievedBackgroundColor: Colors.amber,
          startBackgroundColor: Colors.cyan,
          startCircleColor: Colors.redAccent,
          circleRadius: 100.0,
          achievedCircleColor: Colors.greenAccent,
          onWhenEnd: (v) => print('Uzbekistan'),
        ),
      ),
    );
  }
}
