// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoResponse _$NeoResponseFromJson(Map<String, dynamic> json) {
  return NeoResponse()
    ..elementCount = json['element_count'] as int
    ..nearEarthObjects =
        (json['near_earth_objects'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => Asteroid.fromJson(e as Map<String, dynamic>))
              .toList()),
    );
}

Map<String, dynamic> _$NeoResponseToJson(NeoResponse instance) =>
    <String, dynamic>{
      'element_count': instance.elementCount,
      'near_earth_objects': instance.nearEarthObjects,
    };

Asteroid _$AsteroidFromJson(Map<String, dynamic> json) {
  return Asteroid()
    ..name = json['name'] as String
    ..id = json['id'] as String
    ..estimatedDiameter = EstimatedDiameterData.fromJson(
        json['estimated_diameter'] as Map<String, dynamic>)
    ..closeApproachData = (json['close_approach_data'] as List<dynamic>)
        .map((e) => CloseApproachData.fromJson(e as Map<String, dynamic>))
        .toList()
    ..isPotentiallyHazardous =
        json['is_potentially_hazardous_asteroid'] as bool;
}

Map<String, dynamic> _$AsteroidToJson(Asteroid instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'estimated_diameter': instance.estimatedDiameter,
      'close_approach_data': instance.closeApproachData,
      'is_potentially_hazardous_asteroid': instance.isPotentiallyHazardous,
    };

EstimatedDiameterData _$EstimatedDiameterDataFromJson(
    Map<String, dynamic> json) {
  return EstimatedDiameterData()
    ..kilometers = EstimatedDiameterDataUnit.fromJson(
        json['kilometers'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EstimatedDiameterDataToJson(
        EstimatedDiameterData instance) =>
    <String, dynamic>{
      'kilometers': instance.kilometers,
    };

EstimatedDiameterDataUnit _$EstimatedDiameterDataUnitFromJson(
    Map<String, dynamic> json) {
  return EstimatedDiameterDataUnit()
    ..estimatedDiameterMin = (json['estimated_diameter_min'] as num).toDouble()
    ..estimatedDiameterMax = (json['estimated_diameter_max'] as num).toDouble();
}

Map<String, dynamic> _$EstimatedDiameterDataUnitToJson(
        EstimatedDiameterDataUnit instance) =>
    <String, dynamic>{
      'estimated_diameter_min': instance.estimatedDiameterMin,
      'estimated_diameter_max': instance.estimatedDiameterMax,
    };

CloseApproachData _$CloseApproachDataFromJson(Map<String, dynamic> json) {
  return CloseApproachData()
    ..closeApproachDate = DateTime.parse(json['close_approach_date'] as String)
    ..relativeVelocity = RelativeVelocity.fromJson(
        json['relative_velocity'] as Map<String, dynamic>)
    ..missDistance =
        MissDistance.fromJson(json['miss_distance'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CloseApproachDataToJson(CloseApproachData instance) =>
    <String, dynamic>{
      'close_approach_date': instance.closeApproachDate.toIso8601String(),
      'relative_velocity': instance.relativeVelocity,
      'miss_distance': instance.missDistance,
    };

RelativeVelocity _$RelativeVelocityFromJson(Map<String, dynamic> json) {
  return RelativeVelocity()
    ..kilometersPerHour = json['kilometers_per_hour'] as String;
}

Map<String, dynamic> _$RelativeVelocityToJson(RelativeVelocity instance) =>
    <String, dynamic>{
      'kilometers_per_hour': instance.kilometersPerHour,
    };

MissDistance _$MissDistanceFromJson(Map<String, dynamic> json) {
  return MissDistance()..kilometers = json['kilometers'] as String;
}

Map<String, dynamic> _$MissDistanceToJson(MissDistance instance) =>
    <String, dynamic>{
      'kilometers': instance.kilometers,
    };
