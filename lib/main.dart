import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy/StartingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartingScreen(),
    );
  }
}
