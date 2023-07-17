import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockLoader extends StatefulWidget {
  final Color frameColor;
  final Color minuteColor;
  final Color hourColor;
  final double size;
  final double strokeWidth;
  final Duration duration;
  const ClockLoader({
    super.key,
    this.size = 50,
    required this.frameColor,
    required this.minuteColor,
    required this.hourColor,
    this.strokeWidth = 3,
    this.duration = const Duration(milliseconds: 2000),
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
      duration: widget.duration,
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
          child: SizedBox(
            height: widget.size,
            width: widget.size,
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
  final double strokeWidth;
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
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paint2 = Paint()
      ..color = minuteColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paint3 = Paint()
      ..color = hourColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paint4 = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth * 1.5
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

    canvas.drawCircle(
      center,
      size.height / 2,
      paint1,
    );
    canvas.drawLine(
      startingPoint,
      endingPoint2,
      paint2,
    );
    canvas.drawLine(
      startingPoint,
      endingPoint,
      paint3,
    );
    canvas.drawLine(
      startingPoint,
      startingPoint,
      paint4,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
