import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/helpers/StrigMapingHelper.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/result_list_item/RouteIndicator.dart';
import 'package:multimodal_routeplanner/02_application/bloc/visualization_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Trip.dart';

import '../../../../../../02_application/bloc/route_planner_bloc.dart';

class ResultListItem extends StatelessWidget {
  final List<Trip> trips;
  final Trip trip;
  final int index;

  const ResultListItem(
      {Key? key, required this.trips, required this.trip, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    StringMappingHelper stringMappingHelper = StringMappingHelper();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(stringMappingHelper
                              .mapModeStringToToolTip(trip.mode.toString())),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Distanz: ',
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: trip.distance.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: " km",
                                  style: DefaultTextStyle.of(context).style),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Reisezeit: ',
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: trip.duration.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: " Minuten",
                                  style: DefaultTextStyle.of(context).style),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Externe Kosten: ',
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: trip.costs.externalCosts.all
                                    .toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: " €",
                                  style: DefaultTextStyle.of(context).style),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Interne Kosten: ',
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: trip.costs.internalCosts.all
                                    .toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: " €",
                                  style: DefaultTextStyle.of(context).style),
                            ],
                          ),
                        ),
                      ],
                    ),
                    RouteIndicatorWidget(trip: trip),
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
