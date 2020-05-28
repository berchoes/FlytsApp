class AircraftResponse {
  List<AircraftModel> aircraftTypes;

  AircraftResponse(this.aircraftTypes);

  factory AircraftResponse.fromJson(Map<String, dynamic> json) {
    return AircraftResponse((json['aircraftTypes'] as List)
        ?.map((f) => f == null
            ? null
            : AircraftModel.fromJson(f as Map<String, dynamic>))
        ?.toList());
  }
}

class AircraftModel {
  String iataMain;
  String iataSub;
  String longDescription;
  String shortDescription;

  AircraftModel(
      this.iataMain, this.iataSub, this.longDescription, this.shortDescription);

  factory AircraftModel.fromJson(Map<String, dynamic> json) {
    return AircraftModel(json["iataMain"] as String, json["iataSub"] as String,
        json["longDescription"] as String, json["shortDescription"] as String);
  }
}
