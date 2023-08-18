import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorAdjustmentApp(),
    );
  }
}

class ColorAdjustmentApp extends StatefulWidget {
  @override
  _ColorAdjustmentAppState createState() => _ColorAdjustmentAppState();
}

class _ColorAdjustmentAppState extends State<ColorAdjustmentApp> {
  int redValue = 255; // Initial red value (255 for maximum)
  Color backgroundColor = Colors.white; // Initial background color

  void increaseRed() {
    setState(() {
      if (redValue < 255) {
        redValue += 10;
        backgroundColor = Color.fromARGB(255, redValue, 0, 0);
      }
    });
  }

  void decreaseRed() {
    setState(() {
      if (redValue > 0) {
        redValue -= 10;
        backgroundColor = Color.fromARGB(255, redValue, 0, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Adjustment App'),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: increaseRed,
                child: Text('+'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: decreaseRed,
                child: Text('-'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
