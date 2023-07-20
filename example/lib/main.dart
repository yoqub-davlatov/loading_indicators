import 'package:flutter/material.dart';
import 'package:animated_loading_indicators/animated_loading_indicators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Loading indicators demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo",
        ),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Divider(),
              InfinityCradle(
                size: 20,
              ),
              Divider(),
              InfinityCradle(
                size: 50,
                color: Colors.red,
                duration: Duration(seconds: 1),
              ),
              Divider(),
              ClockLoader(
                frameColor: Colors.deepOrange,
                minuteColor: Colors.blue,
                hourColor: Colors.green,
              ),
              Divider(),
              ClockLoader(
                size: 80,
                strokeWidth: 5,
                frameColor: Colors.deepOrange,
                minuteColor: Colors.blue,
                hourColor: Colors.green,
                duration: Duration(milliseconds: 1500),
              ),
              Divider(),
              ThreeIcons(
                icon: Icons.access_time_filled_sharp,
                iconColor1: Colors.red,
                iconColor2: Colors.black,
                iconColor3: Colors.blue,
                direction: Direction.up,
              ),
              Divider(),
              ThreeIcons(
                size: 25,
                icon: Icons.circle,
                iconColor1: Colors.red,
                iconColor2: Colors.yellow,
                iconColor3: Colors.green,
                duration: Duration(seconds: 1),
              ),
              Divider(),
              FlipIcons(
                icon: Icons.camera,
                first: Colors.red,
                second: Colors.blue,
              ),
              Divider(),
              FlipIcons(
                icon: Icons.home_outlined,
                icon2: Icons.home,
                first: Colors.green,
                second: Colors.amber,
                duration: Duration(seconds: 2),
                size: 50,
              ),
              Divider(),
              PacmanLoader(),
              Divider(),
              PacmanLoader(
                size: 40,
                duration: Duration(milliseconds: 450),
                mainColor: Colors.red,
                borderColor: Colors.transparent,
                eyeColor: Colors.white,
                isStatic: true,
              ),
              Divider(),
              TextLoader(),
              Divider(),
              TextLoader(
                size: 45,
                mainColor: Colors.redAccent,
                secondaryColor: Colors.greenAccent,
                duration: Duration(milliseconds: 600),
              ),
              Divider(),
              YingYangLoader(),
              Divider(),
              YingYangLoader(
                size: 70,
                firstColor: Colors.cyan,
                duration: Duration(seconds: 3),
              ),
              Divider(),
              UpDownLoader(
                duration: Duration(milliseconds: 300),
              ),
              Divider(),
              UpDownLoader(
                size: 15,
                duration: Duration(seconds: 1),
                firstColor: Colors.greenAccent,
                secondColor: Colors.blueAccent,
              ),
              Divider(),
              CircleAnimation(),
              Divider(),
              CircleAnimation(
                size: 45,
                color: Colors.black,
                duration: Duration(milliseconds: 25),
                circleRadius: 100,
              ),
              Divider(),
              LoadingWidget(),
              Divider(),
              LoadingWidget(
                size: 60,
                color1: Colors.black,
                color2: Colors.orange,
                color3: Colors.purple,
                color4: Colors.greenAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              LoadingPercentage(
                isLoading: true,
                backgroundColor: Colors.black54,
                overLoading: null,
                timer: Duration(seconds: 6),
                colorLoading: Colors.blue,
                colorBackgroudLoading: Colors.white,
                paintingStyle: PaintingStyle.stroke,
                strokeJoin: StrokeJoin.round,
                strokeCap: StrokeCap.round,
                strokeWidth: 15.0,
                textColor: Colors.white,
                showProgress: true,
                bottomLoading: null,
                isLineLoading: true, // Set the loading state as needed
                child: SizedBox(),
              ),
              Divider(),
              EyeMoving(timer: Duration(seconds: 6)),
              Divider(),
              EyeMoving(
                timer: Duration(seconds: 1),
                iconSize: 80,
                size: 60,
                icon: IconType.eye,
                container_color: Colors.green,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
