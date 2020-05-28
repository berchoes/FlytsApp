import 'package:flight/models/airline_model.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirlineCell extends StatelessWidget {
  final AirlineModel airline;
  const AirlineCell(this.airline);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.yellowAccent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 3, 10, 0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.yellowAccent,
                  size: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 1),
              child: Text(
                airline.publicName,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  airline.iata ?? "N/A",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.overpass(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
