import 'dart:math';

import 'package:flutter/material.dart';

//This is the app test from Solid Software
//By Luis Torres, Software Developer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color acceptColor;
  int touchCount = 0;

  @override
  void initState() {
    super.initState();
    acceptColor = const Color.fromRGBO(59, 85, 137, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("App Solid Software"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            acceptColor = generateRandomColor();
            touchCount++;
          });
        },
        child: Container(
          color: acceptColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello there',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isColorDark(acceptColor) ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  stringTouch(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isColorDark(acceptColor) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color generateRandomColor() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromRGBO(red, green, blue, 1);
  }

  bool isColorDark(Color color) {
    double relativeBrightness = color.computeLuminance();
    return relativeBrightness < 0.5;
  }

  String stringTouch(){

    String text = '';
    switch (touchCount) {
      case 10:
        text = "It's fun, isn't it?";
        break;
      case 20:
        text = "I could do this all day :D";
        break;
      case 30:
        text = "I'm sure you didn't expect these messages.";
        break;
      case 40:
        text = "And I'm sure you'll want to go back.";
        break;
      case 50:
        text = "You have made 50 touches.";
        break;
      case 52:
        text = "don't you think it's a lot touches?";
        break;
      case 55:
        text = "I see that no, haha";
        break;
      default:
        text = "";
    }
    return text;
  }
}
