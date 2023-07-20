import 'package:flutter/material.dart';
import 'dart:math';

class YingYangLoader extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color firstColor;
  final Color secondColor;
  const YingYangLoader({
    super.key,
    this.size = 50,
    this.duration = const Duration(seconds: 2),
    this.firstColor = Colors.black,
    this.secondColor = Colors.white,
  });

  @override
  State<YingYangLoader> createState() => _YingYangState();
}

class _YingYangState extends State<YingYangLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _animation.value,
      child: CustomPaint(
        painter: YingYangPainter(
          widget.size,
          widget.firstColor,
          widget.secondColor,
        ),
        child: SizedBox(
          width: 2 * widget.size,
          height: 2 * widget.size,
        ),
      ),
    );
  }
}

class YingYangPainter extends CustomPainter {
  final double size;
  late Color firstColor;
  late Color secondColor;

  YingYangPainter(
    this.size,
    this.firstColor,
    this.secondColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()..style = PaintingStyle.fill;
    Offset c = Offset(size.width / 2, size.height / 2);
    Offset blackCircle =
        Offset(size.width / 2, size.height / 2 + this.size / 2);
    Offset whiteCircle =
        Offset(size.width / 2, size.height / 2 - this.size / 2);

    var whiteArc = Path();
    whiteArc.addArc(Rect.fromCircle(center: c, radius: this.size), pi / 2, pi);
    var border = Path();
    border.addArc(Rect.fromCircle(center: c, radius: this.size), 0, 2 * pi);

    canvas.drawCircle(
      c,
      this.size,
      painter..color = firstColor,
    );
    canvas.drawPath(
      whiteArc,
      painter..color = secondColor,
    );

    painter.style = PaintingStyle.fill;

    canvas.drawCircle(
      blackCircle,
      this.size / 2,
      painter..color = firstColor,
    );
    canvas.drawCircle(
      blackCircle,
      this.size / 10,
      painter..color = secondColor,
    );
    canvas.drawCircle(
      whiteCircle,
      this.size / 2,
      painter..color = secondColor,
    );
    canvas.drawCircle(
      whiteCircle,
      this.size / 10,
      painter..color = firstColor,
    );

    canvas.drawPath(
        border,
        painter
          ..style = PaintingStyle.stroke
          ..color = firstColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
