import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipIcons extends StatefulWidget {
  final Color first;
  final Color second;
  final IconData icon;
  final IconData? icon2;
  final Duration duration;
  final double size;
  const FlipIcons({
    super.key,
    required this.icon,
    this.icon2,
    required this.first,
    required this.second,
    this.duration = const Duration(milliseconds: 1200),
    this.size = 30,
  });
  @override
  State<FlipIcons> createState() => _FlipIconsState();
}

class _FlipIconsState extends State<FlipIcons> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        const angle90 = math.pi / 2;
        const angle270 = angle90 * 3;
        var angle = 2 * controller.value * math.pi;
        final transformX = Matrix4.identity()
          ..setEntry(3, 2, 0.0)
          ..rotateX(angle);
        final transformY = Matrix4.identity()
          ..setEntry(3, 2, 0.0)
          ..rotateY(angle);

        return Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              transform: transformX,
              alignment: Alignment.center,
              child: CustomPaint(
                painter: ArcPainter(
                  (angle <= angle270 && angle >= angle90)
                      ? widget.second
                      : widget.first,
                  widget.size,
                ),
                child: SizedBox(
                  height: widget.size * 1.3,
                  width: widget.size * 1.3,
                ),
              ),
            ),
            Transform(
              transform: transformY,
              alignment: Alignment.center,
              child: Icon(
                (angle <= angle270 && angle >= angle90)
                    ? widget.icon
                    : widget.icon2 ?? widget.icon,
                color: (angle <= angle270 && angle >= angle90)
                    ? widget.first
                    : widget.second,
                size: widget.size,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ArcPainter extends CustomPainter {
  final Color color;
  final double _size;
  ArcPainter(this.color, this._size);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = _size / 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const delta = math.pi / 10;
    const angle90 = math.pi / 2;
    const angle180 = angle90 * 2;
    const angle270 = angle90 * 3;
    canvas.drawArc(rect, 0 + delta, angle90 - delta, false, paint);
    canvas.drawArc(rect, angle90 + delta, angle90 - delta, false, paint);
    canvas.drawArc(rect, angle180 + delta, angle90 - delta, false, paint);
    canvas.drawArc(rect, angle270 + delta, angle90 - delta, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
