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
  int redValue = 255;
  int greenValue = 255;
  int blueValue = 255;
  Color backgroundColor = Colors.white;

  void adjustColor(int deltaR, int deltaG, int deltaB) {
    setState(() {
      redValue = (redValue + deltaR).clamp(0, 255);
      greenValue = (greenValue + deltaG).clamp(0, 255);
      blueValue = (blueValue + deltaB).clamp(0, 255);
      backgroundColor = Color.fromARGB(255, redValue, greenValue, blueValue);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adjustColor(10, 0, 0),
                    child: Text('+R'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => adjustColor(-10, 0, 0),
                    child: Text('-R'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adjustColor(0, 10, 0),
                    child: Text('+G'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => adjustColor(0, -10, 0),
                    child: Text('-G'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => adjustColor(0, 0, 10),
                    child: Text('+B'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => adjustColor(0, 0, -10),
                    child: Text('-B'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
