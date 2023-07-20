import 'package:flutter/material.dart';

class UpDownLoader extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color firstColor;
  final Color secondColor;
  const UpDownLoader({
    super.key,
    this.size = 10,
    this.duration = const Duration(milliseconds: 800),
    this.firstColor = Colors.purple,
    this.secondColor = Colors.black,
  });

  @override
  State<UpDownLoader> createState() => _UpDownState();
}

class _UpDownState extends State<UpDownLoader>
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
        _animationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animation = Tween<double>(
      begin: -widget.size,
      end: widget.size,
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
    return CustomPaint(
      painter: UpDownPainter(
        widget.size,
        widget.firstColor,
        widget.secondColor,
        _animation.value,
      ),
      child: SizedBox(
        width: 12 * widget.size,
        height: 4 * widget.size,
      ),
    );
  }
}

class UpDownPainter extends CustomPainter {
  final double size;
  final double move;
  late Color firstColor;
  late Color secondColor;

  UpDownPainter(
    this.size,
    this.firstColor,
    this.secondColor,
    this.move,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2 - this.size * 5, size.height / 2 - move),
        this.size,
        painter..color = firstColor);
    canvas.drawCircle(
        Offset(size.width / 2 - this.size * 2.5, size.height / 2 + move),
        this.size,
        painter..color = secondColor);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2 - move), this.size,
        painter..color = firstColor);
    canvas.drawCircle(
        Offset(size.width / 2 + this.size * 2.5, size.height / 2 + move),
        this.size,
        painter..color = secondColor);
    canvas.drawCircle(
        Offset(size.width / 2 + this.size * 5, size.height / 2 - move),
        this.size,
        painter..color = firstColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
