import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  double borderRadius = 10;
  Color color = Colors.indigo;

  void changeShape() {
    final random = Random();

    setState(() {
      width = random.nextInt(300) + 120;
      height = random.nextInt(300) + 120;
      borderRadius = random.nextInt(100) + 20;
      color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contendor animado'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changeShape,
          child: const Icon(Icons.play_arrow_rounded),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            height: height <= 0 ? 0 : height,
            width: width <= 0 ? 0 : width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                    borderRadius <= 0 ? 0 : borderRadius)),
          ),
        ));
  }
}
