import 'dart:convert';
import 'package:flight/models/aircraft_model.dart';
import 'package:flight/models/airline_model.dart';
import 'package:flight/models/destination_model.dart';
import 'package:flight/models/flight_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static const appId = "757b9e27";
  static const appKey = "0dcd8b3a590f2dbd6414c2ff2513394a";

  static Future<List<AircraftModel>> getAircrafts(int pageNum) async {
    var url =
        "https://api.schiphol.nl/public-flights/aircrafttypes?page=$pageNum&sort=%2BiataMain";
    try {
      final response = await http.get(url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        List<AircraftModel> aircrafts =
            AircraftResponse.fromJson(json.decode(response.body)).aircraftTypes;

        return aircrafts;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }

  static Future<List<AirlineModel>> getAirLines(int page) async {
    var url =
        "https://api.schiphol.nl/public-flights/airlines?page=$page&sort=%2BpublicName";
    try {
      final response = await http.get(url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        List<AirlineModel> airlines =
            AirlineResponse.fromJson(json.decode(response.body)).airlines;
        return airlines;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }

  static Future<AirlineModel> airlineSearch(String search) async {
    String url = "https://api.schiphol.nl/public-flights/airlines/$search";

    try {
      final response = await http.get(url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        AirlineModel airline =
            AirlineModel.fromJson(json.decode(response.body));
        return airline;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }

  static Future<List<Airport>> getDestinations(var page) async {
    var _url =
        "https://api.schiphol.nl/public-flights/destinations?page=$page&sort=%2BpublicName.english";
    try {
      final response = await http.get(_url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        List<Airport> destinations =
            DestinationResponse.fromJson(json.decode(response.body))
                .destinations
                .map((airport) => Airport.fromResponse(airport))
                .toList();
        return destinations;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }

  static Future<List<Airport>> airportSearch(var page, var search) async {
    var _url =
        "https://api.schiphol.nl/public-flights/destinations?page=$page&sort=%2BpublicName.english";
    try {
      final response = await http.get(_url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        List<Airport> destinations =
            DestinationResponse.fromJson(json.decode(response.body))
                .destinations
                .map((airport) => Airport.fromResponse(airport))
                .toList();
        return destinations;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }

  static Future<List<FlightModel>> getFlights(var pageNumber) async {
    var _url =
        "https://api.schiphol.nl/public-flights/flights?includedelays=false&page=$pageNumber&sort=%2BscheduleTime";

    try {
      final response = await http.get(_url, headers: {
        "app_id": appId,
        "app_key": appKey,
        "ResourceVersion": "v4",
        "Accept": "application/json"
      });
      if (response.statusCode == 200) {
        List<FlightModel> flights =
            FlightResponse.fromJson(json.decode(response.body)).flights;
        return flights;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }
}
