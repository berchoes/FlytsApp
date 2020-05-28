import 'package:flight/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fragments/aircraft.page.dart';
import 'fragments/airlines_page.dart';
import 'fragments/destinations_page.dart';
import 'fragments/flights_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget fragmentChanger(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AircraftPage();
      case 1:
        return AirlinesPage();
        break;
      case 2:
        return DestinationsPage();
        break;
      case 3:
        return FlightsPage();
        break;

      default:
        return AircraftPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: fragmentChanger(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[200],
          selectedItemColor: Colors.yellowAccent,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.airplanemode_active),
                title: Text(
                  "Airplanes",
                  style: GoogleFonts.overpass(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_location),
                title: Text(
                  "Airlines",
                  style: GoogleFonts.overpass(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                title: Text(
                  "Destinations",
                  style: GoogleFonts.overpass(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.flight_takeoff),
                title: Text(
                  "Flights",
                  style: GoogleFonts.overpass(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
