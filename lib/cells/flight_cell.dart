import 'package:flight/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightCell extends StatelessWidget {
  final FlightModel flight;
  final int index;

  FlightCell({Key key, @required this.flight, @required this.index})
      : assert(flight != null),
        super(key: key);

  List aircraftList = [
    "Boeing 777",
    "Airbus A320",
    "Boeing 767",
    "Airbus A330",
    "Aerospace 146-100",
    "Fokker 100",
    "Embraer 190",
    "Airbus A310",
    "Freighter 737",
    "Rockwell 690B",
    "Avroliner RJ-100"
  ];

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
                Icons.flight_takeoff,
                color: Colors.white,
                size: 30,
              )),
          title: Row(
            children: <Widget>[
              Text(
                "Flight Name: ",
                style: GoogleFonts.overpass(
                  color: Colors.white,
                ),
              ),
              Text(
                flight.flightName ?? "Unknown",
                style: GoogleFonts.overpass(
                    color: Colors.yellowAccent, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Column(
            children: <Widget>[
              Container(
                height: 1,
                color: Colors.white24,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.fiber_manual_record,
                    color: Colors.yellowAccent,
                    size: 13,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text("Gate: ",
                      style: GoogleFonts.overpass(color: Colors.white)),
                  Text(flight.gate ?? "G30",
                      style: GoogleFonts.overpass(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.airplanemode_active,
                    color: Colors.yellowAccent,
                    size: 13,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text("Aircraft: ",
                      style: GoogleFonts.overpass(color: Colors.white)),
                  Text(aircraftList[index % aircraftList.length],
                      style: GoogleFonts.overpass(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.flight_takeoff,
                    color: Colors.yellowAccent,
                    size: 13,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text("Departure: ",
                      style: GoogleFonts.overpass(color: Colors.white)),
                  Text(
                      "${flight.scheduleTime.substring(0, 5)} ${flight.scheduleDate.substring(8, 10).padLeft(2, '0')}/${flight.scheduleDate.substring(5, 7)}/${flight.scheduleDate.substring(0, 4)}",
                      style: GoogleFonts.overpass(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 35.0)),
    );
  }
}
