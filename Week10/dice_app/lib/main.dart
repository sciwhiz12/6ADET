/*
  Nunag, Arnold Alejo R. - NW-301 - 6ADET - 2026-02-19

  Hands-On Activity:
    Build a Flutter Dice App
*/

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Dice App',
    debugShowCheckedModeBanner: false,
    home: const DiceHomePage(),
  );
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  int diceA = 1;
  int diceB = 1;
  int total = 2;
  final Random random = Random();

  void rollDice() {
    setState(() {
      // 1 to 6
      diceA = random.nextInt(6) + 1;
      diceB = random.nextInt(6) + 1;
      total = diceA + diceB;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache images to avoid flicker when first shown
    precacheImage(AssetImage('assets/images/dice-1.png'), context);
    precacheImage(AssetImage('assets/images/dice-2.png'), context);
    precacheImage(AssetImage('assets/images/dice-3.png'), context);
    precacheImage(AssetImage('assets/images/dice-4.png'), context);
    precacheImage(AssetImage('assets/images/dice-5.png'), context);
    precacheImage(AssetImage('assets/images/dice-6.png'), context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Flutter Dice App')
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/dice-$diceA.png', width: 160),
              Image.asset('assets/images/dice-$diceB.png', width: 160),
            ]
          ),
          Text(
            "Total: $total",
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w500,
              color: 
                total < 6 
                  ? Colors.red.shade800 // < 6
                  : total > 6
                    ? Colors.blue.shade800 // > 6
                    : Colors.yellow.shade800 // = 6
            )
          ),
          FilledButton(onPressed: rollDice, child: const Text('Roll Dice')),
        ],
      ),
    ),
  );
}
