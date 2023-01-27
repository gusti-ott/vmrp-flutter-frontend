// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      Properties.fromJson(json['properties'] as Map<String, dynamic>),
      Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'properties': instance.properties,
      'geometry': instance.geometry,
    };
