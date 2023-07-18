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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfiniteCradle(
              size: 20,
            ),
            InfiniteCradle(
              size: 50,
              color: Colors.red,
              duration: Duration(seconds: 1),
            ),
            ClockLoader(
              frameColor: Colors.deepOrange,
              minuteColor: Colors.blue,
              hourColor: Colors.green,
            ),
            ClockLoader(
              size: 80,
              strokeWidth: 5,
              frameColor: Colors.deepOrange,
              minuteColor: Colors.blue,
              hourColor: Colors.green,
              duration: Duration(milliseconds: 1500),
            ),
            ThreeIcons(
              icon: Icons.access_time_filled_sharp,
              iconColor1: Colors.red,
              iconColor2: Colors.black,
              iconColor3: Colors.blue,
              direction: Direction.up,
            ),
            ThreeIcons(
              size: 25,
              icon: Icons.circle,
              iconColor1: Colors.red,
              iconColor2: Colors.yellow,
              iconColor3: Colors.green,
              duration: Duration(seconds: 1),
            ),
            FlipIcons(
              icon: Icons.camera,
              first: Colors.red,
              second: Colors.blue,
            ),
            FlipIcons(
              icon: Icons.home_outlined,
              icon2: Icons.home,
              first: Colors.green,
              second: Colors.amber,
              duration: Duration(seconds: 2),
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
