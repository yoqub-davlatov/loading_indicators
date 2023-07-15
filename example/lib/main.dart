import 'package:flutter/material.dart';
import 'package:loading_indicators/loading_indicators.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              ),
            ],
          ),
        ));
  }
}
