import 'package:json_annotation/json_annotation.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Properties.dart';

import 'Geometry.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  final Properties properties;
  final Geometry geometry;

  Address(this.properties, this.geometry);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
