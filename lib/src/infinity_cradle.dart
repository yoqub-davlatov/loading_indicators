import 'package:flutter/material.dart';
import 'dart:math' as math;

class InfinityCradle extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;
  const InfinityCradle({
    super.key,
    this.size = 30,
    this.color = Colors.black,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<InfinityCradle> createState() => _InfinityCradleState();
}

class _InfinityCradleState extends State<InfinityCradle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  final Tween<double> _rotationTween = Tween(begin: 0, end: 1.6 * math.pi);
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    animation = _rotationTween.animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: 1.4 * widget.size,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.rotate(
                  origin: Offset(widget.size / 3, -widget.size / 2),
                  angle: animation.value,
                  child: Dot(
                    size: widget.size / 3,
                    color: widget.color,
                  )),
              Transform.translate(
                offset: Offset(animationController.value * -widget.size / 3, 0),
                child: Row(
                  children: [
                    Dot(
                      size: widget.size / 3,
                      color: widget.color,
                    ),
                    Dot(
                      size: widget.size / 3,
                      color: widget.color,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;
  final double size;
  const Dot({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
