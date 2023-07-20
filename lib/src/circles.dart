import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Duration duration;
  final double size;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  const LoadingWidget({
    super.key,
    this.duration = const Duration(seconds: 1),
    this.size = 40,
    this.color1 = Colors.blue,
    this.color2 = Colors.red,
    this.color3 = Colors.green,
    this.color4 = Colors.yellow,
  });

  @override
  LoadingWidgetState createState() => LoadingWidgetState();
}

class LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the bounding box size based on the given size
    final boxSize = (widget.size * 2) + 50;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Center(
          child: SizedBox(
            width: boxSize,
            height: boxSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BouncingBall(
                  shapeColor: widget.color1,
                  yOffset: -50 * _animation.value,
                  size: widget.size,
                ),
                BouncingBall(
                  shapeColor: widget.color2,
                  yOffset: 50 * _animation.value,
                  size: widget.size,
                ),
                BouncingBall(
                  shapeColor: widget.color3,
                  xOffset: -50 * _animation.value,
                  size: widget.size,
                ),
                BouncingBall(
                  shapeColor: widget.color4,
                  xOffset: 50 * _animation.value,
                  size: widget.size,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BouncingBall extends StatelessWidget {
  final Color shapeColor;
  final double xOffset;
  final double yOffset;
  final double size;

  const BouncingBall({
    super.key,
    required this.shapeColor,
    this.xOffset = 0,
    this.yOffset = 0,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum allowed offsets to keep the ball within the bounding box
    final maxXOffset = (size * 1.5) - (size / 2);
    final maxYOffset = (size * 1.5) - (size / 2);

    return Transform.translate(
      offset: Offset(
        xOffset.clamp(-maxXOffset, maxXOffset),
        yOffset.clamp(-maxYOffset, maxYOffset),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: shapeColor,
        ),
      ),
    );
  }
}
