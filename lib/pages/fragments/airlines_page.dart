import 'dart:math';

import 'package:flight/cells/airline_cell.dart';
import 'package:flight/cells/searched_airline.dart';
import 'package:flight/models/airline_model.dart';
import 'package:flight/services/services.dart';
import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:google_fonts/google_fonts.dart';

class AirlinesPage extends StatefulWidget {
  @override
  _AirlinesPageState createState() => _AirlinesPageState();
}

class _AirlinesPageState extends State<AirlinesPage> {
  Icon _customIcon = Icon(Icons.search);
  final _searchController = TextEditingController();
  var rnd = Random();
  final iataList = [
    "KC",
    "JP",
    "F5",
    "A3",
    "AM",
    "SU",
    "UX",
    "AF",
    "MK",
    "YW",
    "KM",
    "SM"
  ];
  @override
  void initState() {
    super.initState();
  }

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
                              hintText:
                                  "  Iata Code: ${iataList[rnd.nextInt(iataList.length)]} ",
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
                                text: 'lines',
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
        body: widgetChoice(_searchController));
  }

  Widget _customSearchBar = RichText(
    text: TextSpan(
        style: TextStyle(color: Colors.white, fontSize: 25),
        children: [
          TextSpan(
              text: 'Air',
              style: GoogleFonts.overpass(fontWeight: FontWeight.w200)),
          TextSpan(
              text: 'lines',
              style: GoogleFonts.overpass(fontWeight: FontWeight.bold)),
        ]),
  );

  Widget widgetChoice(TextEditingController controller) {
    if (controller.text.isEmpty || _customIcon.icon == Icons.search) {
      _searchController.clear();
      return defaultAirlines();
    } else
      return searchAirlines(controller.text);
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.yellowAccent),
      ),
    );
  }

  Widget searchAirlines(String search) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<AirlineModel>(
            future: Services.airlineSearch(search),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text(
                    "No Result :(",
                    style:
                        GoogleFonts.overpass(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasData) {
                return SearchedAirline(snapshot.data);
              }
              return circularProgress();
            }),
      ],
    );
  }

  Widget defaultAirlines() {
    return PagewiseGridView.count(
      pageSize: 20,
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, AirlineModel airline, _) => AirlineCell(airline),
      loadingBuilder: (context) => circularProgress(),
      pageFuture: (pageNum) => Services.getAirLines(pageNum),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
