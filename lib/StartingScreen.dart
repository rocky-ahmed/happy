import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:happy/NextScreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:confetti/confetti.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 3);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                _controllerCenterRight.play();
                _controllerCenterLeft.play();
                timer.cancel();
              } else {
                _start = _start - 1;
              }
            }));
  }

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllerCenterLeft.dispose();
    _controllerCenterRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.pinkAccent,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NextScreen()));
        },
        child: Icon(
          FlutterIcons.play_circle_outline_mdi,
          color: Colors.white,
          size: 55,
        ),
        backgroundColor: Color(0xFF13195b),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/hbd1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "$_start",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirection: pi,
                  particleDrag: 0.05,
                  emissionFrequency: 0.05,
                  numberOfParticles: 20,
                  gravity: 0.05,
                  shouldLoop: false,
                  colors: const [Colors.green, Colors.blue, Colors.pink],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _controllerCenterLeft,
                  blastDirection: 0,
                  emissionFrequency: 0.6,
                  minimumSize: const Size(10, 10),
                  maximumSize: const Size(50, 50),
                  numberOfParticles: 1,
                  gravity: 0.1,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 30),
                    child: Text(
                      "Happiee",
                      style: TextStyle(
                        color: Color(0xff13195b),
                        fontWeight: FontWeight.w900,
                        fontSize: 90,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Birthday",
                      style: TextStyle(
                        color: Color(0xff13195b),
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
