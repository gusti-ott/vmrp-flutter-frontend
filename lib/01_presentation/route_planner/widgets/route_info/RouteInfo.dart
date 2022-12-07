import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_info_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Trip.dart';

class RouteInfo extends StatelessWidget {
  final Trip trip;
  final bool visible;

  const RouteInfo({Key? key, required this.trip, required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Visibility(
      visible: visible,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          width: 300,
          height: 200,
          child: Card(
            color: themeData.colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Distanz: ${trip.distance.toStringAsFixed(2)} km'),
                      Text('Fahrzeit: ${trip.duration.toStringAsFixed(2)} min'),
                      Text(
                          'interne Kosten: ${trip.costs.internalCosts.all.toStringAsFixed(2)} €'),
                      Text(
                          'externe Kosten: ${trip.costs.externalCosts.all.toStringAsFixed(2)} €'),
                      ExpansionTile(
                        title: Text('MobiScore: ${trip.mobiScore}'),
                        subtitle: const Text('erfahre mehr zum MobiScore'),
                        children: const [Text('der MobiScore ist cool')],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<RouteInfoBloc>(context)
                                  .add(HideRouteInfoEvent(trip: trip));
                            },
                            icon: const Icon(Icons.close))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
