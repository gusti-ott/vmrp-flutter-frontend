import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/dummy_variables/Dummy.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/legend/Legend.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/map/MapWidget.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/route_info/RouteInfo.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/mode_input/RouteButton.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/ResultListSuccessfull.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/ResultListError.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/ResultListInitial.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/result_list/ResultListWaiting.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_info_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_planner_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/visualization_bloc.dart';
import '../../03_domain/entities/MobilityMode.dart';
import '../../03_domain/entities/Trip.dart';
import '../../03_domain/enums/MobilityModeEnum.dart';
import '../helpers/ModeMapingHelper.dart';
import 'widgets/search_page/mode_input/SelectionIconButton.dart';

class RoutePlannerPage extends StatelessWidget {
  const RoutePlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    // TODO: remove this when online
    String startAddress = "Arcisstraße 21, München";
    String endAddress = "Schleißheimerstr. 318, München";

    final dummy = Dummy();
    Trip dummyTrip = dummy.getDummyTrip();

    String mode = "";

    StringMappingHelper stringMappingHelper = StringMappingHelper();

    Map<String, Trip> trips = {};

    void updateTrips() async {
      if (trips[mode] != null) {
        BlocProvider.of<RoutePlannerBloc>(context)
            .add(DeleteRouteEvent(mode, trips));
      } else {
        BlocProvider.of<RoutePlannerBloc>(context).add(
          RouteRequestedEvent(
              startAddress,
              endAddress,
              MobilityMode(mode: stringMappingHelper.mapModeStringToMode(mode)),
              trips),
        );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          const MapWidget(),
          Row(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: 350,
                  color: themeData.colorScheme.primary.withOpacity(0.7),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                        child: TextFormField(
                          onChanged: ((value) {
                            startAddress = value.toString();
                          }),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Startadresse",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: TextFormField(
                          onChanged: ((value) {
                            endAddress = value.toString();
                          }),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Zieladresse",
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ),
                      RouteButtonWidget(
                        startAddress: startAddress,
                        endAddress: endAddress,
                        updateTrips: () async {
                          Map<String, Trip> emptyTrips = {};
                          BlocProvider.of<RoutePlannerBloc>(context).add(
                            RouteRequestedEvent(
                                startAddress,
                                endAddress,
                                MobilityMode(mode: MobilityModeEnum.mvg),
                                emptyTrips),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Row(children: [
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text("individuelle Wege",
                                style: themeData.textTheme.headline1),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'WALK';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'WALK'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'CAR';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'CAR'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'BICYCLE';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'BICYCLE'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'MOPED';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'MOPED')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'ECAR';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'ECAR'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'EBICYCLE';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'EBICYCLE'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'EMOPED';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'EMOPED'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Row(children: [
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text("Wege mit Sharing",
                                style: themeData.textTheme.headline1),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'CAB';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'CAB'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'EMMY';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'EMMY'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'TIER';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'TIER'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'FLINKSTER';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'FLINKSTER'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'SHARENOW';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'SHARENOW'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Row(children: [
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text("Wege mit ÖPNV",
                                style: themeData.textTheme.headline1),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 3,
                                  color: themeData.colorScheme.onPrimary)),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'PT';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'PT'),
                          SelectionIconButton(
                              updateTrips: () {
                                mode = 'INTERMODAL_PT_BIKE';
                                updateTrips();
                              },
                              trips: trips,
                              startAddress: startAddress,
                              endAddress: endAddress,
                              mode: 'INTERMODAL_PT_BIKE'),
                        ],
                      ),
                      BlocBuilder<RoutePlannerBloc, RoutePlannerState>(
                        builder: (context, routePlannerState) {
                          if (routePlannerState is RoutePlannerInitial) {
                            return const ResultListInitial();
                          } else if (routePlannerState
                              is RoutePlannerStateLoading) {
                            return const ResultListWaiting();
                          } else if (routePlannerState
                              is RoutePlannerStateLoaded) {
                            trips = routePlannerState.trips;

                            // print("trips updated" + trips.toString());

                            List<Trip> listTrips = trips.values.toList();

                            if (listTrips.isNotEmpty) {
                              BlocProvider.of<VisualizationBloc>(context).add(
                                  ChangeRouteVizualizationEvent(
                                      selectedTrip: listTrips[0],
                                      trips: listTrips));
                            }

                            return ResultList(trips: listTrips);
                            //ResultListItem(trip: routePlannerState.trip);
                          } else if (routePlannerState
                              is RoutePlannerStateError) {
                            return ResultListError(
                                message: routePlannerState.message);
                          }
                          return const Placeholder();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              RouteInfo(
                trip: dummyTrip,
                visible: true,
              )
              //TODO: uncomment BlocBuilder when design finished
              // BlocBuilder<RouteInfoBloc, RouteInfoState>(
              //     builder: (context, routeInfoState) {
              //   if (routeInfoState is RouteInfoLoadedState) {
              //     return RouteInfo(trip: routeInfoState.trip, visible: true);
              //   } else if (routeInfoState is RouteInfoHiddenState) {
              //     return RouteInfo(trip: routeInfoState.trip, visible: false);
              //   } else {
              //     return const Visibility(visible: false, child: Placeholder());
              //   }
              // }),
            ],
          ),
          const Align(alignment: AlignmentDirectional.topEnd, child: Legend()),
        ],
      ),
    );
  }
}
