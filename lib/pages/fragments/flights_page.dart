import 'package:flight/streams/flight_stream.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FlightsPage extends StatefulWidget {
  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 8,
          title: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 25),
                children: [
                  TextSpan(
                      text: 'Flight',
                      style: GoogleFonts.overpass(fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: 'List',
                      style: GoogleFonts.overpass(fontWeight: FontWeight.bold)),
                ]),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: FlightStream());
  }
}
