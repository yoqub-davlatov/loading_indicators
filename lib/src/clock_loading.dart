import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockLoader extends StatefulWidget {
  final Color frameColor;
  final Color minuteColor;
  final Color hourColor;
  double? size;
  double? strokeWidth;
  ClockLoader({
    super.key,
    this.size,
    required this.frameColor,
    required this.minuteColor,
    required this.hourColor,
    this.strokeWidth,
  });

  @override
  State<ClockLoader> createState() => _ClockLoaderState();
}

class _ClockLoaderState extends State<ClockLoader>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  final Tween<double> _rotationTween = Tween(begin: 0, end: 2 * math.pi);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            controller.repeat();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        },
      );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: ShapePainter(
            animation.value * 2,
            animation.value,
            widget.frameColor,
            widget.minuteColor,
            widget.hourColor,
            widget.strokeWidth,
          ),
          child: Container(
            height: widget.size ?? 50,
            width: widget.size ?? 50,
          ),
        );
      },
    );
  }
}

class ShapePainter extends CustomPainter {
  double angle;
  double angle2;
  final Color frameColor;
  final Color minuteColor;
  final Color hourColor;
  final double? strokeWidth;
  ShapePainter(
    this.angle,
    this.angle2,
    this.frameColor,
    this.minuteColor,
    this.hourColor,
    this.strokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = frameColor
      ..strokeWidth = strokeWidth ?? 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paint2 = Paint()
      ..color = minuteColor
      ..strokeWidth = strokeWidth ?? 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paint3 = Paint()
      ..color = hourColor
      ..strokeWidth = strokeWidth ?? 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.height * 0.4;
    double radius2 = size.height * 0.2;
    Offset startingPoint = Offset(size.width / 2, size.height / 2);
    Offset endingPoint = Offset(
      radius2 * math.cos(angle2) + startingPoint.dx,
      radius2 * math.sin(angle2) + startingPoint.dy,
    );
    Offset endingPoint2 = Offset(
      radius * math.cos(angle) + startingPoint.dx,
      radius * math.sin(angle) + startingPoint.dy,
    );
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.height / 2, paint1);
    canvas.drawLine(startingPoint, endingPoint2, paint2);
    canvas.drawLine(startingPoint, endingPoint, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
