import 'package:json_annotation/json_annotation.dart';

part 'Properties.g.dart';

@JsonSerializable()
class Properties {
  final String? name;
  final String? street;
  final String? housenumber;
  final String? postcode;
  final String? city;
  final String? country;

  Properties(this.name, this.street, this.housenumber, this.postcode, this.city, this.country);

  factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);
}
