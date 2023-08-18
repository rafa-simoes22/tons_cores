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
  int greenValue = 0;
  int blueValue = 0;
  Color backgroundColor = Colors.white;
  Color fontColor = Colors.black;

  void adjustRed(int delta) {
    setState(() {
      redValue = (redValue + delta).clamp(0, 255);
      updateBackgroundAndFontColor();
    });
  }

  void adjustGreen(int delta) {
    setState(() {
      greenValue = (greenValue + delta).clamp(0, 255);
      updateBackgroundAndFontColor();
    });
  }

  void adjustBlue(int delta) {
    setState(() {
      blueValue = (blueValue + delta).clamp(0, 255);
      updateBackgroundAndFontColor();
    });
  }

  void updateBackgroundAndFontColor() {
    backgroundColor = Color.fromARGB(255, redValue, greenValue, blueValue);

    // Determine the appropriate font color based on background brightness
    double brightness =
        (redValue * 0.299 + greenValue * 0.587 + blueValue * 0.114) / 255;
    fontColor = brightness > 0.5 ? Colors.black : Colors.white;
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
                    onPressed: () {
                      adjustRed(10);
                      greenValue = 0;
                      blueValue = 0;
                    },
                    child: Text('+R'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      adjustRed(-10);
                      greenValue = 0;
                      blueValue = 0;
                    },
                    child: Text('-R'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      adjustGreen(10);
                      redValue = 0;
                      blueValue = 0;
                    },
                    child: Text('+G'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      adjustGreen(-10);
                      redValue = 0;
                      blueValue = 0;
                    },
                    child: Text('-G'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      adjustBlue(10);
                      redValue = 0;
                      greenValue = 0;
                    },
                    child: Text('+B'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      adjustBlue(-10);
                      redValue = 0;
                      greenValue = 0;
                    },
                    child: Text('-B'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'R: $redValue, G: $greenValue, B: $blueValue',
                style: TextStyle(color: fontColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
