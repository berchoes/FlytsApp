import 'package:flight/models/airline_model.dart';
import 'package:flight/style/theme.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchedAirline extends StatelessWidget {
  final AirlineModel airline;

  const SearchedAirline(this.airline);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.airplanemode_active,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(width: 10),
            Text(airline.publicName,
                style: GoogleFonts.overpass(fontSize: 25, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("IATA Code: ",
                    style: GoogleFonts.overpass(color: Colors.white)),
                Text(airline.iata,
                    style: GoogleFonts.overpass(color: Colors.yellowAccent))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ICAO Code: ",
                  style: GoogleFonts.overpass(color: Colors.white),
                ),
                Text(airline.icao,
                    style: GoogleFonts.overpass(color: Colors.yellowAccent))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
