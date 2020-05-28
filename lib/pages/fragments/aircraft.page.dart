import 'package:flight/streams/aircraft_stream.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AircraftPage extends StatefulWidget {
  @override
  _AircraftPageState createState() => _AircraftPageState();
}

class _AircraftPageState extends State<AircraftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 8,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 25),
                children: [
                  TextSpan(
                      text: 'Air',
                      style: GoogleFonts.overpass(fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: 'planes',
                      style: GoogleFonts.overpass(fontWeight: FontWeight.bold)),
                ]),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: AircraftStream());
  }
}
