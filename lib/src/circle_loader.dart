import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class CircleAnimation extends StatefulWidget {
  final int numberOfCircles;
  final double circleRadius;
  final double size;
  final Color color;
  final Duration duration;
  const CircleAnimation({
    super.key,
    this.numberOfCircles = 10,
    this.circleRadius = 30,
    this.color = Colors.teal,
    this.size = 15,
    this.duration = const Duration(milliseconds: 10),
  });
  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> {
  double angle = 0.0;
  @override
  void initState() {
    super.initState();
    // Start a timer to update the angle for circle positioning
    startTimer();
  }

  void startTimer() {
    // Set up a timer to update the angle every 50 milliseconds
    Timer.periodic(widget.duration, (timer) {
      setState(() {
        angle += 0.02; // Adjust the speed of rotation here
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerSize = widget.circleRadius * 4 + (widget.size * 3);
    return Center(
      child: SizedBox(
        width: containerSize,
        height: containerSize,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: List.generate(widget.numberOfCircles, (index) {
              // Calculate the angle for the current circle
              double currentAngle =
                  (2 * pi / widget.numberOfCircles) * index + angle;

              // Calculate the position of the circle along the imaginary circle
              double x =
                  widget.circleRadius * cos(currentAngle) + containerSize / 2;
              double y =
                  widget.circleRadius * sin(currentAngle) + containerSize / 2;

              // Calculate the intensity of green for the current circle
              double greenIntensity = index / widget.numberOfCircles;

              return Positioned(
                left: x - widget.circleRadius,
                top: y - widget.circleRadius,
                child: GreenCircle(
                  greenIntensity: greenIntensity,
                  size: widget.size,
                  color: widget.color,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class GreenCircle extends StatelessWidget {
  final double greenIntensity;
  final double size;
  final Color color;

  const GreenCircle({
    super.key,
    required this.greenIntensity,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, // Adjust the size of the circle here
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(greenIntensity),
      ),
    );
  }
}
