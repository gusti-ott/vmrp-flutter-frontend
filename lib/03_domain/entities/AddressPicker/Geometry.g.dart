// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      json['type'] as String,
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };
