import 'package:flutter/material.dart';
import 'dart:math';

class TextLoader extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color mainColor;
  final Color secondaryColor;
  const TextLoader({
    super.key,
    this.size = 60,
    this.duration = const Duration(seconds: 1, milliseconds: 500),
    this.mainColor = Colors.black,
    this.secondaryColor = Colors.purple,
  });

  @override
  State<TextLoader> createState() => _TextLoaderState();
}

class _TextLoaderState extends State<TextLoader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;
  late Animation animationOp;

  bool _firstAnimation = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _firstAnimation = false;
            _animationController.reset();
          }
          if (status == AnimationStatus.dismissed) {
            _firstAnimation = true;
            _animationController.forward();
          }
        },
      );

    animation = Tween<double>(
      begin: 0,
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "L",
            style: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.w900,
              color: widget.mainColor,
              fontFamily: "sans-serif",
              fontStyle: FontStyle.normal,
            ),
          ),
          CustomPaint(
            painter: TextPainter(
              _firstAnimation ? animation.value : animationOp.value,
              widget.size / 2.8,
              widget.mainColor,
              widget.secondaryColor,
            ),
            child: SizedBox(
              height: widget.size,
              width: widget.size,
            ),
          ),
          Text(
            "ADDING",
            style: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.w900,
              color: widget.mainColor,
              fontStyle: FontStyle.normal,
              fontFamily: "sans-serif",
            ),
          ),
          Text(
            "...",
            style: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.w900,
              color: widget.secondaryColor,
              fontStyle: FontStyle.normal,
              fontFamily: "sans-serif",
            ),
          ),
        ],
      ),
    );
  }
}

class TextPainter extends CustomPainter {
  late double size;
  late double angle;
  late Color mainColor;
  late Color secondaryColor;

  TextPainter(
    this.angle,
    this.size,
    this.mainColor,
    this.secondaryColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()..style = PaintingStyle.fill;

    Offset c = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: c,
        radius: this.size,
      ),
      7 * pi / 4 + angle,
      3 * pi / 4,
      false,
      painter
        ..style = PaintingStyle.stroke
        ..color = secondaryColor
        ..strokeWidth = this.size / 3.5,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: c,
        radius: this.size,
      ),
      3 * pi / 4 + angle,
      3 * pi / 4,
      false,
      painter
        ..style = PaintingStyle.stroke
        ..color = mainColor
        ..strokeWidth = this.size / 3.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
