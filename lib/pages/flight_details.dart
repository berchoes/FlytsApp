import 'dart:math';

import 'package:flight/models/flight_model.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightDetails extends StatefulWidget {
  final FlightModel flight;

  FlightDetails({@required this.flight});

  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  Random rnd = Random();

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
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 25),
              children: [
                TextSpan(
                    text: 'Flight',
                    style: GoogleFonts.overpass(fontWeight: FontWeight.w200)),
                TextSpan(
                    text: 'Details',
                    style: GoogleFonts.overpass(fontWeight: FontWeight.bold)),
              ]),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: AppColors.primaryColor,
              height: 20,
            ),
            Container(height: 1, color: Colors.white24),
            buildFlightInfo(widget.flight, Icons.flight_takeoff),
            Container(height: 1, color: Colors.white24),
            buildAircraftInfo(widget.flight, Icons.airplanemode_active),
            Container(height: 1, color: Colors.white24),
            Row(
              children: <Widget>[
                Expanded(
                  child: buildDepartureInfo("TAKEOFF", widget.flight),
                ),
                Expanded(
                  child: buildLandingInfo("LANDING", widget.flight),
                ),
              ],
            ),
            Container(height: 1, color: Colors.white24),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'EMPTY SEATS',
                            style: GoogleFonts.overpass(
                                fontSize: 18, color: Colors.grey[400]),
                          ),
                          Text(
                            rnd.nextInt(120).toString(),
                            style: GoogleFonts.overpass(
                                fontSize: 48, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'CABIN CLASS',
                            style: GoogleFonts.overpass(
                                fontSize: 18, color: Colors.grey[400]),
                          ),
                          Text(
                            'ECONOMY\nCLASS',
                            style: GoogleFonts.overpass(
                                fontSize: 24, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 12),
                        blurRadius: 12,
                      ),
                    ],
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width * 2, 100)),
                  ),
                ),
                Center(
                  child: Material(
                    color: Colors.yellowAccent,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          'BUY TICKET',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.overpass(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFlightInfo(FlightModel flight, IconData icon) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Text(
                  flight.gate ?? "G30",
                  style: GoogleFonts.overpass(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.grey[400]),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Flight Name: ",
                        style: GoogleFonts.overpass(
                            fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        flight.flightName ?? "Unknown",
                        style: GoogleFonts.overpass(
                            fontSize: 20, color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "ID: ",
                        style: GoogleFonts.overpass(
                            fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        flight.id,
                        style: GoogleFonts.overpass(
                            fontSize: 12, color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildAircraftInfo(FlightModel flight, IconData icon) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Text(
                  flight.prefixIATA ?? "A23",
                  style: GoogleFonts.overpass(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.grey[400]),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Model: ",
                        style: GoogleFonts.overpass(
                            fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        aircraftList[rnd.nextInt(aircraftList.length)],
                        style: GoogleFonts.overpass(
                            fontSize: 20, color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "IATA Code: ",
                        style: GoogleFonts.overpass(
                            fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        flight.aircraftType?.iataMain ?? "N240",
                        style: GoogleFonts.overpass(
                            fontSize: 12, color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildDepartureInfo(String title, FlightModel flight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              flight.scheduleDate.substring(8, 10).padLeft(2, '0') ?? "06",
              style: GoogleFonts.overpass(fontSize: 48, color: Colors.white),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      flight.scheduleDate.substring(5, 7),
                      style: GoogleFonts.overpass(
                          fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '/${flight.scheduleDate.substring(0, 4)}',
                      style: GoogleFonts.overpass(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  flight.scheduleTime.substring(0, 5),
                  style: GoogleFonts.overpass(
                      fontSize: 16, color: Colors.grey[400]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLandingInfo(String title, FlightModel flight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: GoogleFonts.overpass(fontSize: 18, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              flight.scheduleDate.substring(8, 10).padLeft(2, '0') ?? "06",
              style: GoogleFonts.overpass(fontSize: 48, color: Colors.white),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      flight.scheduleDate.substring(5, 7),
                      style: GoogleFonts.overpass(
                          fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '/${flight.scheduleDate.substring(0, 4)}',
                      style: GoogleFonts.overpass(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  flight.lastUpdatedAt?.substring(11, 16) ?? "06:32",
                  style: GoogleFonts.overpass(
                      fontSize: 16, color: Colors.grey[400]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
