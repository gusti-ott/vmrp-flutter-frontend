import 'package:latlong2/latlong.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Costs/Costs.dart';
import 'package:multimodal_routeplanner/03_domain/enums/MobilityMode.dart';

class Segment {
  final double distance;
  final double duration;
  final List<LatLng> waypoints;
  final Costs costs;
  final MobilityMode mode;

  Segment(
      {required this.distance,
      required this.duration,
      required this.waypoints,
      required this.costs,
      required this.mode});
}
