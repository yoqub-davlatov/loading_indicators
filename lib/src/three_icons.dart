import 'package:flutter/material.dart';

enum Direction { up, down }

class ThreeIcons extends StatefulWidget {
  final Color iconColor1;
  final Color iconColor2;
  final Color iconColor3;
  final IconData icon;
  final Duration duration;
  final double size;
  final Direction direction;
  const ThreeIcons({
    super.key,
    required this.icon,
    required this.iconColor1,
    required this.iconColor2,
    required this.iconColor3,
    this.duration = const Duration(milliseconds: 1200),
    this.size = 20,
    this.direction = Direction.down,
  });
  @override
  State<ThreeIcons> createState() => _ThreeIconsState();
}

class _ThreeIconsState extends State<ThreeIcons>
    with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation1 = Tween<double>(begin: 0, end: 1).animate(controller);
    animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1),
      ),
    );
    animation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 1),
      ),
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double coef = widget.direction == Direction.up ? -25 : 25;
    return SizedBox(
      width: 4 * widget.size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(
                    0,
                    animation1.value <= 0.5
                        ? animation1.value
                        : 1 - animation1.value) *
                coef,  
            child: mainIcon(widget.iconColor1),
          ),
          Transform.translate(
            offset: Offset(
                    0,
                    animation2.value <= 0.5
                        ? animation2.value
                        : 1 - animation2.value) *
                coef,
            child: mainIcon(widget.iconColor2),
          ),
          Transform.translate(
            offset: Offset(
                    0,
                    animation3.value <= 0.5
                        ? animation3.value
                        : 1 - animation3.value) *
                coef,
            child: mainIcon(widget.iconColor3),
          ),
        ],
      ),
    );
  }

  Widget mainIcon(final Color color) {
    return Icon(
      widget.icon,
      size: widget.size,
      color: color,
    );
  }
}
