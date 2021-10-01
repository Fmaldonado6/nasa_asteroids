import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class NeoResponse {
  @JsonKey(name: "element_count")
  int elementCount = 0;

  @JsonKey(name: "near_earth_objects")
  Map<String, List<Asteroid>> nearEarthObjects = Map();

  NeoResponse();

  factory NeoResponse.fromJson(Map<String,dynamic> json) {
    return _$NeoResponseFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$NeoResponseToJson(this);
  }

}

@JsonSerializable()
class Asteroid {
  String name = "";
  String id = "";
  @JsonKey(name: "estimated_diameter")
  EstimatedDiameterData estimatedDiameter = EstimatedDiameterData();
  @JsonKey(name: "close_approach_data")
  List<CloseApproachData> closeApproachData = [];
  @JsonKey(name: "is_potentially_hazardous_asteroid")
  bool isPotentiallyHazardous = false;

  Asteroid();

   factory Asteroid.fromJson(Map<String,dynamic> json) {
    return _$AsteroidFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$AsteroidToJson(this);
  }
}

@JsonSerializable()
class EstimatedDiameterData {
  EstimatedDiameterDataUnit kilometers = EstimatedDiameterDataUnit();

  EstimatedDiameterData();

     factory EstimatedDiameterData.fromJson(Map<String,dynamic> json) {
    return _$EstimatedDiameterDataFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$EstimatedDiameterDataToJson(this);
  }
}

@JsonSerializable()
class EstimatedDiameterDataUnit {
  @JsonKey(name: "estimated_diameter_min")
  double estimatedDiameterMin = 0;
  @JsonKey(name: "estimated_diameter_max")
  double estimatedDiameterMax = 0;

  EstimatedDiameterDataUnit();

     factory EstimatedDiameterDataUnit.fromJson(Map<String,dynamic> json) {
    return _$EstimatedDiameterDataUnitFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$EstimatedDiameterDataUnitToJson(this);
  }
}

@JsonSerializable()
class CloseApproachData {
  @JsonKey(name: "close_approach_date")
  DateTime closeApproachDate = DateTime.now();
  @JsonKey(name: "relative_velocity")
  RelativeVelocity relativeVelocity = RelativeVelocity();
  @JsonKey(name: "miss_distance")
  MissDistance missDistance = MissDistance();

  CloseApproachData();

      factory CloseApproachData.fromJson(Map<String,dynamic> json) {
    return _$CloseApproachDataFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$CloseApproachDataToJson(this);
  }

}

@JsonSerializable()
class RelativeVelocity {
  @JsonKey(name: "kilometers_per_hour")
  String kilometersPerHour = "";

  RelativeVelocity();

       factory RelativeVelocity.fromJson(Map<String,dynamic> json) {
    return _$RelativeVelocityFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$RelativeVelocityToJson(this);
  }
}

@JsonSerializable()
class MissDistance {
  String kilometers = "";

  MissDistance();

        factory MissDistance.fromJson(Map<String,dynamic> json) {
    return _$MissDistanceFromJson(json);
  }

  Map<String,dynamic> toJson() {
    return _$MissDistanceToJson(this);
  }

}
