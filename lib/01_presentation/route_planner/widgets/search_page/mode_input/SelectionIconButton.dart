import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/helpers/ModeMapingHelper.dart';
import '../../../../../02_application/bloc/route_planner_bloc.dart';
import '../../../../../03_domain/entities/Trip.dart';

class SelectionIconButton extends StatelessWidget {
  final Map<String, Trip> trips;
  final String mode;
  final String startAddress;
  final String endAddress;
  final Function() updateTrips;

  const SelectionIconButton(
      {Key? key,
      required this.trips,
      required this.startAddress,
      required this.endAddress,
      required this.mode,
      required this.updateTrips})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    StringMappingHelper stringMappingHelper = StringMappingHelper();

    final themeData = Theme.of(context);

    return BlocBuilder<RoutePlannerBloc, RoutePlannerState>(
      builder: (context, routePlannerState) {
        if (routePlannerState is RoutePlannerStateLoaded) {
          if (routePlannerState.trips[mode] == null) {
            isSelected = false;
          } else {
            isSelected = true;
          }
        }

        return IntrinsicWidth(
          child: SizedBox(
            width: 60,
            child: Column(children: [
              IconButton(
                  onPressed: updateTrips,
                  icon: stringMappingHelper
                              .mapModeStringToIcon(mode)
                              .runtimeType ==
                          Icon
                      ? stringMappingHelper.mapModeStringToIcon(mode)
                      : Container(
                          foregroundDecoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.transparent : Colors.grey,
                              backgroundBlendMode: isSelected
                                  ? BlendMode.color
                                  : BlendMode.saturation,
                              shape: BoxShape.circle),
                          child: stringMappingHelper.mapModeStringToIcon(mode),
                        ),
                  iconSize: stringMappingHelper
                              .mapModeStringToIcon(mode)
                              .runtimeType ==
                          Icon
                      ? 25
                      : 40,
                  tooltip: stringMappingHelper.mapModeStringToToolTip(mode),
                  color: isSelected
                      ? themeData.colorScheme.secondary
                      : Colors.white),
              Divider(
                height: 4,
                thickness: 3,
                color:
                    isSelected ? themeData.colorScheme.secondary : Colors.grey,
                indent: 16,
                endIndent: 16,
              )
            ]),
          ),
        );
      },
    );
  }
}
