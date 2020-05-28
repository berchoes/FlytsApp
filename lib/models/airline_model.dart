class AirlineResponse {
  List<AirlineModel> airlines;

  AirlineResponse(this.airlines);

  factory AirlineResponse.fromJson(Map<String, dynamic> json) {
    return AirlineResponse((json['airlines'] as List)
        ?.map((f) =>
    f == null ? null : AirlineModel.fromJson(f as Map<String, dynamic>))
        ?.toList());
  }
}

class AirlineModel {
  String iata;
  String icao;
  String publicName;

  AirlineModel(this.iata, this.icao, this.publicName);

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(json["iata"] as String, json["icao"] as String,
        json["publicName"] as String);
  }
}
