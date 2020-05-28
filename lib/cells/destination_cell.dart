import 'package:flight/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationCell extends StatelessWidget {
  final Airport airport;

  DestinationCell({Key key, @required this.airport})
      : assert(airport != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white24,
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              )),
          title: Text(
            airport.publicName.english.isEmpty
                ? airport.city.toUpperCase()
                : airport.publicName.english.toUpperCase(),
            style: GoogleFonts.overpass(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    color: Colors.yellowAccent,
                    size: 20,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                      "${airport.city ?? "Somewhere"}, ${airport.country ?? "Unknown"}",
                      style: GoogleFonts.overpass(color: Colors.white))
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                  SizedBox(
                    width: 2,
                  ),
                  Text(airport.iata ?? "N/A",
                      style: GoogleFonts.overpass(color: Colors.white))
                ],
              ),
            ],
          ) /*,
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0)*/
          ),
    );
  }
}
