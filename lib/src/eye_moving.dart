import 'package:flutter/material.dart';

class EyeMoving extends StatefulWidget {
  final double rotationAngle;
  final double iconSize;
  final Duration timer;
  final Color colorIcon;
  final bool increasing;
  final double height;
  final double width;
  final double boarderSize; 

  const EyeMoving({
    Key? key,
    this.colorIcon = Colors.black,
    this.rotationAngle = 1,
    this.iconSize = 35,
    required this.timer,
    this.increasing = true,
    this.height = 150,
    this.width = 150,
    this.boarderSize = 200 , 
  }) : super(key: key);

  @override
  _EyeMovingState createState() => _EyeMovingState();
}

class _EyeMovingState extends State<EyeMoving>
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
        height: widget.height,
        width: widget.width,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(widget.boarderSize),
          ),
          child: Transform.rotate(
            angle: rotationAngle,
            child: Icon(Icons.sunny, size: iconSize),
          ),
        ),
      ),
    );
  }
}
