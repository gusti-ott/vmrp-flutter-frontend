import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/helpers/StrigMapingHelper.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/result_list_item/RouteIndicator.dart';
import 'package:multimodal_routeplanner/02_application/bloc/visualization_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Trip.dart';

import '../../../../../../02_application/bloc/route_planner_bloc.dart';

class ResultListItem2 extends StatelessWidget {
  final List<Trip> trips;
  final Trip trip;
  final int index;

  const ResultListItem2(
      {Key? key, required this.trips, required this.trip, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    StringMappingHelper stringMappingHelper = StringMappingHelper();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            BlocProvider.of<VisualizationBloc>(context).add(
                ChangeRouteVizualizationEvent(
                    selectedTrip: trip, trips: trips));
          },
          child: Card(
            color: index == 0
                ? themeData.colorScheme.tertiary
                : themeData.colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            stringMappingHelper.mapModeStringToToolTip(
                              trip.mode.toString(),
                            ),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          stringMappingHelper
                              .mapModeStringToIcon(trip.mode.toString()),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Distanz: ',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: trip.distance.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " km",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Reisezeit: ',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: trip.duration.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " Minuten",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Extern: ',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: trip.costs.externalCosts.all
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " €",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Intern: ',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                  text: trip.costs.internalCosts.all
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " €",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                          Image(
                            image: stringMappingHelper
                                .mapMobiScoreStringToPath(trip.mobiScore),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: RouteIndicatorWidget(trip: trip)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
