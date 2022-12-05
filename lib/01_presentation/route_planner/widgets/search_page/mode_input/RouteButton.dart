import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../02_application/bloc/route_planner_bloc.dart';
import '../../../../../03_domain/entities/MobilityMode.dart';
import '../../../../../03_domain/entities/Trip.dart';
import '../../../../../03_domain/enums/MobilityModeEnum.dart';

class RouteButtonWidget extends StatelessWidget {
  final String startAddress, endAddress;
  final Function() updateTrips;
  const RouteButtonWidget(
      {super.key,
      required this.startAddress,
      required this.endAddress,
      required this.updateTrips});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    /*  onRouteButtonClick() async {
      Map<String, Trip> emptyTrips = {};
      BlocProvider.of<RoutePlannerBloc>(context).add(
        RouteRequestedEvent(startAddress, endAddress,
            MobilityMode(mode: MobilityModeEnum.mvg), emptyTrips),
      );
    } */

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: updateTrips,
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themeData.colorScheme.secondary,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'neue Route',
                      style: themeData.textTheme.bodySmall,
                    ),
                    const Icon(Icons.directions),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
