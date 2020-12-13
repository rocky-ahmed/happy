import 'dart:ui';

import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xff13195b),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Message",
                ),
                Tab(
                  text: "Memories",
                ),
              ],
            ),
            centerTitle: true,
            title: Text(
              "Happy Birthday",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          body: TabBarView(children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 36, right: 16, bottom: 36),
              child: Card(
                elevation: 10,
                shadowColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I hope your birthday as sweet as the cake . and the year to follow is failed with as such joy as you bring your friends....",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OleoScript",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 36, right: 16, bottom: 36),
              child: Card(
                elevation: 10,
                shadowColor: Colors.blueAccent,
                child: ListView(
                  children: [
                    Image(
                      image: AssetImage("images/11.jpg"),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
