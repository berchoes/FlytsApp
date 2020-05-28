import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2000),
        () => Navigator.pushReplacementNamed(context, "/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/source.gif"), fit: BoxFit.contain)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 45, 0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Flyts by Berchoes",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.overpass(
                      color: Colors.black,
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
