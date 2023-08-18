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
  int redValue = 0;
  int greenValue = 0;
  int blueValue = 0;
  Color backgroundColor = Colors.black;
  Color fontColor = Colors.white;

  void adjustColor(int deltaR, int deltaG, int deltaB) {
    setState(() {
      redValue = (redValue + deltaR).clamp(0, 255);
      greenValue = (greenValue + deltaG).clamp(0, 255);
      blueValue = (blueValue + deltaB).clamp(0, 255);
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
                  Slider(
                    value: redValue.toDouble(),
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      setState(() {
                        redValue = value.toInt();
                        updateBackgroundAndFontColor();
                      });
                    },
                    activeColor: Colors.red,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    value: greenValue.toDouble(),
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      setState(() {
                        greenValue = value.toInt();
                        updateBackgroundAndFontColor();
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    value: blueValue.toDouble(),
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      setState(() {
                        blueValue = value.toInt();
                        updateBackgroundAndFontColor();
                      });
                    },
                    activeColor: Colors.blue,
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
