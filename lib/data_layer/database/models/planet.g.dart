// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanetImpl _$$PlanetImplFromJson(Map<String, dynamic> json) => _$PlanetImpl(
      id: json['id'] as int?,
      planetSize: json['planetSize'] as int,
      planetRemoteness: json['planetRemoteness'] as int,
      planetSpeed: (json['planetSpeed'] as num).toDouble(),
      planetColor: const ColorSerialiser().fromJson(json['planetColor'] as int),
    );

Map<String, dynamic> _$$PlanetImplToJson(_$PlanetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planetSize': instance.planetSize,
      'planetRemoteness': instance.planetRemoteness,
      'planetSpeed': instance.planetSpeed,
      'planetColor': const ColorSerialiser().toJson(instance.planetColor),
    };
