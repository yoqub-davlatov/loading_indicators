import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingPercentage extends StatefulWidget {
  const LoadingPercentage({
    Key? key,
    required this.isLoading,
    required this.child,
    this.backgroundColor = Colors.black, // changed
    this.overLoading,
    this.timer = const Duration(seconds: 10),
    this.colorLoading = Colors.blue,
    this.colorBackgroudLoading = Colors.white,
    this.paintingStyle = PaintingStyle.stroke,
    this.strokeJoin = StrokeJoin.round,
    this.strokeCap = StrokeCap.round,
    this.strokeWidth = 15.0,
    this.textColor = Colors.white,
    this.showProgress = true,
    this.bottomLoading,
    this.isLineLoading = true,
  }) : super(key: key);

  final bool isLoading;
  final Color backgroundColor;
  final Widget child;
  final Widget? overLoading;
  final Widget? bottomLoading;
  final bool isLineLoading;
  final Duration timer;
  final Color colorLoading;
  final Color colorBackgroudLoading;
  final PaintingStyle paintingStyle;
  final StrokeJoin strokeJoin;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final Color textColor;
  final bool showProgress;

  @override
  _LoadingPercentageState createState() => _LoadingPercentageState();
}

class _LoadingPercentageState extends State<LoadingPercentage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  int once = 1;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.timer);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (once == 1) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Downloading Finished.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
          once = 0 ; 
        }
        setState(() {
          _controller.reset();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      setState(() {
        _controller.reset();
        _controller.forward();
      });
    }

    return Stack(
      children: <Widget>[
        widget.child,
        Visibility(
          visible: widget.isLoading,
          child: Container(
            color: widget.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.isLineLoading
                  ? buildLinePainter()
                  : buildCirclePainter(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildLinePainter() {
    return [
      if (widget.overLoading != null) widget.overLoading!,
      SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.colorBackgroudLoading,
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        margin: const EdgeInsets.all(8.0),
        height: 25,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 50),
              painter: LinePainter(
                progress: _controller.value,
                color: Colors.blue,
                paintingStyle: widget.paintingStyle,
                strokeCap: widget.strokeCap,
                strokeJoin: widget.strokeJoin,
                strokeWidth: widget.strokeWidth,
              ),
            );
          },
        ),
      ),
      SizedBox(height: 20),
      if (widget.showProgress)
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return _buildprogress();
          },
        ),
      SizedBox(height: 20),
      if (widget.bottomLoading != null) widget.bottomLoading!,
    ];
  }

  List<Widget> buildCirclePainter() {
    return [
      if (widget.overLoading != null) widget.overLoading!,
      SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        child: Center(
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 50),
                    painter: CirclesPainter(
                      progress: _controller.value,
                      color: widget.colorLoading,
                      paintingStyle: widget.paintingStyle,
                      strokeCap: widget.strokeCap,
                      strokeJoin: widget.strokeJoin,
                      strokeWidth: widget.strokeWidth,
                    ),
                  );
                },
              ),
              if (widget.showProgress)
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return _buildprogress();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      SizedBox(height: 20),
      if (widget.bottomLoading != null) widget.bottomLoading!,
    ];
  }

  Widget _buildprogress() {
    return Text(
      _controller.value < 1
          ? (_controller.value * 100).toInt().toString() + ' %'
          : '99 %',
      style: TextStyle(color: widget.textColor, fontSize: 30),
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter({
    required this.progress,
    required this.color,
    required this.paintingStyle,
    required this.strokeJoin,
    required this.strokeCap,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final PaintingStyle paintingStyle;
  final StrokeJoin strokeJoin;
  final StrokeCap strokeCap;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle
      ..strokeJoin = strokeJoin
      ..strokeCap = strokeCap;

    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2)
      ..close();

    PathMetric pathMetric = path.computeMetrics().first;
    Path extractPath =
        pathMetric.extractPath(0.0, pathMetric.length * progress / 2);

    canvas.drawPath(extractPath, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CirclesPainter extends CustomPainter {
  CirclesPainter({
    required this.progress,
    required this.color,
    required this.paintingStyle,
    required this.strokeJoin,
    required this.strokeCap,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final PaintingStyle paintingStyle;
  final StrokeJoin strokeJoin;
  final StrokeCap strokeCap;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle
      ..strokeJoin = strokeJoin
      ..strokeCap = strokeCap;

    var path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 80));

    PathMetric pathMetric = path.computeMetrics().first;
    Path extractPath =
        pathMetric.extractPath(0.0, pathMetric.length * progress);

    canvas.drawPath(extractPath, _paint);
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) {
    return true;
  }
}
