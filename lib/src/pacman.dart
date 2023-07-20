import 'package:flutter/material.dart';
import 'dart:math';

class PacmanLoader extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color mainColor;
  final Color borderColor;
  final Color eyeColor;
  final bool isStatic;
  const PacmanLoader({
    super.key,
    this.size = 30,
    this.duration = const Duration(milliseconds: 200),
    this.mainColor = Colors.yellow,
    this.borderColor = Colors.black,
    this.eyeColor = Colors.black,
    this.isStatic = false,
  });

  @override
  State<PacmanLoader> createState() => _PacmanLoaderState();
}

class _PacmanLoaderState extends State<PacmanLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          }
          if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          }
        },
      );

    animation = Tween<double>(
      begin: 7 * pi / 4,
      end: 2 * pi,
    ).animate(_animationController)
      ..addListener(
        () {
          setState(
            () {},
          );
        },
      );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PacmanPainter(
        animation.value,
        widget.size,
        widget.mainColor,
        widget.borderColor,
        widget.eyeColor,
        widget.isStatic,
      ),
      child: SizedBox(
        height: 2 * widget.size,
        width: 2 * widget.size,
      ),
    );
  }
}

class PacmanPainter extends CustomPainter {
  late double size;
  late double angle;
  late Color mainColor;
  late Color borderColor;
  late Color eyeColor;
  late bool isStatic;

  PacmanPainter(
    this.angle,
    this.size,
    this.mainColor,
    this.borderColor,
    this.eyeColor,
    this.isStatic,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()..style = PaintingStyle.fill;
    var factor = (angle - pi * 2);

    Offset c = Offset(
      size.width / 2,
      size.height / 2 - (isStatic ? 0 : factor * 6),
    );
    Offset eyePos = Offset(
      size.width / 2 + (this.size / 10),
      size.height / 2 - this.size / 2 - (isStatic ? 0 : factor * 6),
    );

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: this.size + 2),
      -factor - 0.01,
      angle + factor + 0.02,
      true,
      painter..color = borderColor,
    );

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: this.size),
      -factor,
      angle + factor,
      true,
      painter..color = mainColor,
    );

    canvas.drawCircle(
      eyePos,
      this.size / 9.5,
      painter..color = eyeColor,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
