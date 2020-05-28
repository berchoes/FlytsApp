import 'package:flight/cells/aircraft_cell.dart';
import 'package:flight/lists/aircraft_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AircraftStream extends StatefulWidget {
  const AircraftStream({
    Key key,
  }) : super(key: key);

  @override
  _AircraftStreamState createState() => _AircraftStreamState();
}

class _AircraftStreamState extends State<AircraftStream> {
  final scrollController = ScrollController();
  AircraftList posts;

  @override
  void initState() {
    posts = AircraftList();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        posts.loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: posts.stream,
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
                return AircraftCell(
                  aircraft: _snapshot.data[index],
                  index: index,
                );
              } else if (posts.hasMore) {
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
