import 'package:flight/lists/shared_lists.dart';
import 'package:flight/models/destination_model.dart';
import 'package:flight/streams/destination_stream.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationsPage extends StatefulWidget {
  @override
  _DestinationsPageState createState() => _DestinationsPageState();
}

class _DestinationsPageState extends State<DestinationsPage> {
  Icon _customIcon = Icon(Icons.search);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 8,
          actions: <Widget>[
            IconButton(
              icon: _customIcon,
              color: Colors.yellowAccent,
              onPressed: () {
                setState(() {
                  if (this._customIcon.icon == Icons.search) {
                    this._customIcon = Icon(Icons.cancel);
                    this._customSearchBar = Theme(
                        data: ThemeData(
                            primaryColor: Colors.yellowAccent,
                            cursorColor: Colors.yellowAccent),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: "  Enter airport name ",
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontStyle: FontStyle.italic)),
                          style: TextStyle(color: Colors.white),
                          controller: _searchController,
                          onChanged: (text) {
                            setState(() {});
                          },
                        ));
                  } else {
                    SharedLists.destinations.clear();
                    this._customIcon = Icon(Icons.search);
                    this._customSearchBar = RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          children: [
                            TextSpan(
                                text: 'Air',
                                style: GoogleFonts.overpass(
                                    fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: 'ports',
                                style: GoogleFonts.overpass(
                                    fontWeight: FontWeight.bold)),
                          ]),
                    );
                  }
                });
              },
            ),
            SizedBox(width: 20)
          ],
          title: _customSearchBar,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: _widgetChoice(_searchController));
  }

  Widget _customSearchBar = RichText(
    text: TextSpan(
        style: TextStyle(color: Colors.white, fontSize: 25),
        children: [
          TextSpan(
              text: 'Air',
              style: GoogleFonts.overpass(fontWeight: FontWeight.w200)),
          TextSpan(
              text: 'ports',
              style: GoogleFonts.overpass(fontWeight: FontWeight.bold)),
        ]),
  );

  Widget _widgetChoice(TextEditingController controller) {
    if (controller.text.isEmpty || _customIcon.icon == Icons.search) {
      controller.clear();
      return DestinationStream();
    } else
      return searchDestinations(SharedLists.destinations, controller.text);
  }

  Widget searchDestinations(List<Airport> list, String search) {
    if (list
        .where((a) => (a.publicName.english
                .toLowerCase()
                .contains(search.toLowerCase()) ||
            nullChecker(a.city).toLowerCase().contains(search.toLowerCase()) ||
            nullChecker(a.country)
                .toLowerCase()
                .contains(search.toLowerCase())))
        .toList()
        .isEmpty)
      return Center(
          child: Text(
        "No Result :(",
        style: GoogleFonts.overpass(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));
    else
      return listView(list, search);
  }

  Widget listView(List<Airport> list, String search) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: list
          .where((a) => (a.publicName.english
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              nullChecker(a.city)
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              nullChecker(a.country)
                  .toLowerCase()
                  .contains(search.toLowerCase())))
          .toList()
          .map((destination) => airportCard(destination))
          .toList(),
    );
  }

  String nullChecker(var string) {
    if (string == null) {
      return "Unknown";
    } else
      return string;
  }

  Widget airportCard(Airport airport) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 3),
      child: Card(
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
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
