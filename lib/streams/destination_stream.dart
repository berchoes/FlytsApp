import 'package:flight/cells/destination_cell.dart';
import 'package:flight/lists/destination_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationStream extends StatefulWidget {
  const DestinationStream({
    Key key,
  }) : super(key: key);

  @override
  _DestinationStreamState createState() => _DestinationStreamState();
}

class _DestinationStreamState extends State<DestinationStream> {
  final scrollController = ScrollController();
  DestinationList airports;

  @override
  void initState() {
    airports = DestinationList();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        airports.loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: airports.stream,
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
                return DestinationCell(
                  airport: _snapshot.data[index],
                );
              } else if (airports.hasMore) {
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
