class DestinationResponse {
  List<DestinationModel> destinations;

  DestinationResponse(this.destinations);

  factory DestinationResponse.fromJson(Map<String, dynamic> json) {
    return DestinationResponse((json['destinations'] as List)
        ?.map((f) =>
    f == null ? null : DestinationModel.fromJson(f as Map<String, dynamic>))
        ?.toList());
  }
}

class PublicName{
  String dutch;
  String english;
  PublicName(this.dutch,this.english);

  factory PublicName.fromJson(Map<String,dynamic> json){
    return PublicName(json["dutch"] as String, json["english"] as String);
  }
}

class DestinationModel {
  String city;
  String country;
  String iata;
  PublicName publicName;

  DestinationModel(this.city, this.country,this.iata, this.publicName);

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(json["city"] as String, json["country"] as String,
        json["iata"] as String, PublicName.fromJson(json["publicName"]));
  }
}
class Airport {
  String city;
  String country;
  String iata;
  PublicName publicName;

  Airport({this.city, this.country,this.iata, this.publicName});

  Airport.fromResponse(DestinationModel response)
      : city = response.city,
        country = response.country,
        iata = response.iata,
        publicName = response.publicName;
}