import 'package:flight/cells/flight_cell.dart';

import 'package:flight/lists/flight_list.dart';
import 'package:flight/models/flight_model.dart';
import 'package:flight/pages/flight_details.dart';
import 'package:flight/pages/fragments/flights_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightStream extends StatefulWidget {
  const FlightStream({
    Key key,
  }) : super(key: key);

  @override
  _FlightStreamState createState() => _FlightStreamState();
}

class _FlightStreamState extends State<FlightStream> {
  final scrollController = ScrollController();
  FlightList flights;

  @override
  void initState() {
    flights = FlightList();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        flights.loadMore();
      }
    });
    super.initState();
  }

  _goDetails(BuildContext context, FlightModel flight) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (BuildContext context) => FlightDetails(
          flight: flight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: flights.stream,
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (!_snapshot.hasData) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 53),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.yellowAccent),
              ),
            ],
          ));
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            controller: scrollController,
            separatorBuilder: (context, index) => Divider(),
            itemCount: _snapshot.data.length + 1,
            itemBuilder: (BuildContext _context, int index) {
              if (index < _snapshot.data.length) {
                return GestureDetector(
                  onTap: () => _goDetails(context, _snapshot.data[index]),
                  child: FlightCell(
                    flight: _snapshot.data[index],
                    index: index,
                  ),
                );
              } else if (flights.hasMore) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.yellowAccent),
                  )),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(
                      child: Text(
                    'Nothing more to Load!',
                    style: GoogleFonts.overpass(
                        color: Colors.yellowAccent, fontSize: 16),
                  )),
                );
              }
            },
          );
        }
      },
    );
  }
}
