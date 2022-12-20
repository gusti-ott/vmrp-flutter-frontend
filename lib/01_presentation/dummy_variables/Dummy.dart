import 'package:multimodal_routeplanner/03_domain/entities/Costs/Costs.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Costs/ExternalCosts.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Costs/InternalCosts.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Segment.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Trip.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Waypoint.dart';

class Dummy {
  Trip getDummyTrip() {
    Segment dummySegment = Segment(
        distance: 4.52,
        duration: 16.25,
        costs: Costs(
          internalCosts: InternalCosts(all: 4.5),
          externalCosts: ExternalCosts(
              all: 1.05,
              accidents: 0.1,
              air: 0.2,
              space: 0.2,
              barrier: 0.15,
              noise: 0.1,
              congestion: 0.05,
              climate: 0.25),
        ),
        mode: 'BICYCLE',
        waypoints: [
          Waypoint(lat: 48.1662627, lon: 11.5768211),
          Waypoint(lat: 48.1662627, lon: 11.5768211),
          Waypoint(lat: 48.1662627, lon: 11.5768211),
          Waypoint(lat: 48.1662627, lon: 11.5768211)
        ]);

    Trip dummyTrip = Trip(
        distance: 4.52,
        duration: 16.25,
        costs: Costs(
          internalCosts: InternalCosts(all: 4.5),
          externalCosts: ExternalCosts(
              all: 1.05,
              accidents: 0.1,
              air: 0.2,
              space: 0.2,
              barrier: 0.15,
              noise: 0.1,
              congestion: 0.05,
              climate: 0.25),
        ),
        mobiScore: 'C',
        segments: [dummySegment],
        mode: 'BICYCLE');

    return dummyTrip;
  }
}
