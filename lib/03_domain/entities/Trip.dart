import 'package:multimodal_routeplanner/03_domain/entities/Costs/Costs.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Segment.dart';

class Trip {
  final List<Segment> segments;
  final double distance;
  final double duration;
  final Costs costs;

  Trip(
      {required this.segments,
      required this.distance,
      required this.duration,
      required this.costs});
}
