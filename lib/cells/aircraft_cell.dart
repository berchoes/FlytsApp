import 'dart:math';
import 'package:flight/models/aircraft_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AircraftCell extends StatelessWidget {
  final AircraftModel aircraft;
  final int index;

  const AircraftCell({Key key, @required this.aircraft, @required this.index})
      : assert(aircraft != null),
        super(key: key);

  static var planeList = [
    "assets/plane.jpeg",
    "assets/plane1.jpg",
    "assets/plane2.jpg",
    "assets/plane3.jpg",
    "assets/plane4.jpg",
    "assets/plane5.jpg",
    "assets/plane6.jpg",
    "assets/plane7.jpg",
    "assets/plane8.jpg",
    "assets/plane9.jpg",
    "assets/plane10.jpg",
    "assets/plane11.jpg",
    "assets/plane12.jpg",
    "assets/plane13.jpg",
    "assets/plane14.jpg",
    "assets/plane15.jpg",
    "assets/plane16.jpg",
    "assets/plane17.jpg",
    "assets/plane18.jpg",
  ];

  static final rnd = Random();
  //planeList[rnd.nextInt(planeList.length)]

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
              child: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage(planeList[index % planeList.length]))),
          title: Text(
            aircraft.longDescription.toUpperCase(),
            style: GoogleFonts.overpass(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              SizedBox(
                width: 2,
              ),
              Text(aircraft.iataMain ?? "N/A",
                  style: GoogleFonts.overpass(color: Colors.white))
            ],
          ) /*,
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0)*/
          ),
    );
  }
}
