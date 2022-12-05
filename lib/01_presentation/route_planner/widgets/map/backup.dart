import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';

import '../../../../02_application/bloc/route_planner_bloc.dart';
import '../../../../03_domain/entities/Trip.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutePlannerBloc, RoutePlannerState>(
      bloc: BlocProvider.of<RoutePlannerBloc>(context),
      builder: (context, routePlannerState) {
        if (routePlannerState is RoutePlannerStateLoaded &&
            routePlannerState.trips.isNotEmpty) {
          Trip bestTrip = routePlannerState.trips.values.toList()[0];

          return FlutterMap(
            options: MapOptions(
              plugins: [
                TappablePolylineMapPlugin(),
              ],
              center: LatLng(48.1662627, 11.5768211),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              /* MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 25.0,
                                height: 25.0,
                                point: LatLng(48.1662627, 11.5768211),
                                builder: (ctx) => const FlutterLogo(),
                              ),
                            ],
                          ), */

              TappablePolylineLayerOptions(
                  polylineCulling: true,
                  polylines: [
                    for (var i = 0; i < bestTrip.segments.length; i++)
                      TaggedPolyline(
                        points: bestTrip.segments[i].getWaypointInLagLng(),
                        tag: "My Poliline",
                        strokeWidth: 5,
                        color: mapSegmentModeToColor(bestTrip.segments[i].mode),
                      ),
                  ],
                  onTap: (polylines, tapPosition) => print('Tapped: ' +
                      polylines.map((polyline) => polyline.tag).join(',') +
                      ' at ' +
                      tapPosition.globalPosition.toString()),
                  onMiss: (tapPosition) {
                    print('No polyline was tapped at position ' +
                        tapPosition.globalPosition.toString());
                  }),
            ],
          );
        } else {
          return FlutterMap(
            options: MapOptions(
              plugins: [
                TappablePolylineMapPlugin(),
              ],
              center: LatLng(48.1662627, 11.5768211),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              /* MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 25.0,
                                height: 25.0,
                                point: LatLng(48.1662627, 11.5768211),
                                builder: (ctx) => const FlutterLogo(),
                              ),
                            ],
                          ), */
            ],
          );
        }
      },
    );
  }

  mapSegmentModeToColor(String segmentType) {
    switch (segmentType) {
      case 'Car':
        return Color.fromARGB(255, 236, 145, 8);

      case 'Moped':
        return Color.fromARGB(255, 186, 189, 12);

      case 'Bicycle':
        return Color.fromARGB(255, 130, 172, 114);

      case 'E-Scooter':
        return Color.fromARGB(255, 23, 196, 181);

      case 'Walk':
        return Color.fromARGB(255, 18, 155, 18);

      case 'U-Bahn':
        return Color.fromARGB(255, 10, 113, 231);

      case 'S-Bahn':
        return Color.fromARGB(255, 8, 99, 8);

      case 'Tram':
        return Color.fromARGB(255, 109, 56, 6);

      case 'Bus':
        return Color.fromARGB(255, 29, 63, 212);

      default:
        return Color.fromARGB(255, 151, 157, 158);
    }
  }
}
