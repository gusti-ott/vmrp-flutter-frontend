import 'package:json_annotation/json_annotation.dart';

part 'Geometry.g.dart';

@JsonSerializable()
class Geometry {
  final List<double> coordinates;
  final String type;

  Geometry(this.coordinates, this.type);

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
}
