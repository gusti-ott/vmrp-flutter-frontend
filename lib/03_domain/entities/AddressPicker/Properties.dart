import 'package:json_annotation/json_annotation.dart';

part 'Properties.g.dart';

@JsonSerializable()
class Properties {
  final String? name;
  final String? street;
  final String? housenumber;
  final String? postcode;

  Properties(this.name, this.street, this.housenumber, this.postcode);

  factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);
}
