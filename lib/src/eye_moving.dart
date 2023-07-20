import 'package:flutter/material.dart';

enum IconType {
  sun,
  eye,
}

class EyeMoving extends StatefulWidget {
  final double rotationAngle;
  final double iconSize;
  final Duration timer;
  final Color colorIcon;
  final bool increasing;
  final double size;
  final double boarderSize;
  final IconType icon;
  final Color containerColor;
  const EyeMoving({
    Key? key,
    this.colorIcon = Colors.black,
    this.rotationAngle = 1,
    this.iconSize = 35,
    required this.timer,
    this.increasing = true,
    this.size = 150,
    this.boarderSize = 200,
    this.icon = IconType.sun,
    this.containerColor = Colors.red,
  }) : super(key: key);

  @override
  EyeMovingState createState() => EyeMovingState();
}

class EyeMovingState extends State<EyeMoving>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double rotationAngle;
  late double iconSize;
  late bool increasing;

  @override
  void initState() {
    super.initState();
    rotationAngle = widget.rotationAngle;
    iconSize = widget.iconSize;
    increasing = widget.increasing;

    animationController = AnimationController(
      vsync: this,
      duration: widget.timer,
    );

    animationController.repeat(reverse: true);
    animationController.addListener(() {
      setState(() {
        rotationAngle = animationController.value * 5;
        if (increasing) {
          iconSize = iconSize * 1.02;
          if (iconSize > 100) {
            increasing = false;
          }
        } else {
          iconSize = iconSize / 1.02;
          if (iconSize <= 50) {
            increasing = true;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Container(
          decoration: BoxDecoration(
            color: widget.containerColor,
            borderRadius: BorderRadius.circular(widget.boarderSize),
          ),
          child: Transform.rotate(
            angle: rotationAngle,
            child: Icon(getIcon(widget.icon),
                size: iconSize >= widget.size ? widget.size : iconSize),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  IconData getIcon(IconType iconType) {
    switch (iconType) {
      case IconType.sun:
        return Icons.sunny;
      default:
        return Icons.remove_red_eye;
    }
  }
}
