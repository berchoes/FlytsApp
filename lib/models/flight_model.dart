class FlightResponse {
  List<FlightModel> flights;

  FlightResponse(this.flights);

  factory FlightResponse.fromJson(Map<String, dynamic> json) {
    return FlightResponse((json['flights'] as List)
        ?.map((f) =>
            f == null ? null : FlightModel.fromJson(f as Map<String, dynamic>))
        ?.toList());
  }
}

class BaggageClaimType {
  List<String> belts;

  BaggageClaimType(this.belts);

  factory BaggageClaimType.fromJson(Map<String, dynamic> json) {
    return BaggageClaimType(json["belts"] as List);
  }
}

class AircraftType {
  String iataMain;
  String iataSub;

  AircraftType(this.iataMain, this.iataSub);

  factory AircraftType.fromJson(Map<String, dynamic> json) {
    return AircraftType(json["iataMain"] as String, json["iataSub"] as String);
  }
}

class FlightModel {
  String actualLandingTime;
  String flightName;
  String estimatedLandingTime;
  int flightNumber;
  String gate;
  String id;
  String scheduleDate;
  String scheduleTime;
  String lastUpdatedAt;
  String prefixIATA;
  AircraftType aircraftType;
  //BaggageClaimType baggageClaim;

  FlightModel(
      this.actualLandingTime,
      this.flightName,
      this.estimatedLandingTime,
      this.flightNumber,
      this.gate,
      this.id,
      this.scheduleDate,
      this.scheduleTime,
      this.lastUpdatedAt,
      this.prefixIATA,
      this.aircraftType);

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
        json["actualLandingTime"] as String,
        json["flightName"] as String,
        json["estimatedLandingTime"] as String,
        json["flightNumber"] as int,
        json["gate"] as String,
        json["id"] as String,
        json["scheduleDate"] as String,
        json["scheduleTime"] as String,
        json["lastUpdatedAt"] as String,
        json["prefixIATA"] as String,
        AircraftType.fromJson(json["aircraftType"]));
  }
}
