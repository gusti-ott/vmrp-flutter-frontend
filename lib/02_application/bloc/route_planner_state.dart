part of 'route_planner_bloc.dart';

@immutable
abstract class RoutePlannerState {}

class RoutePlannerInitial extends RoutePlannerState {}

class RoutePlannerStateLoading extends RoutePlannerState {}

class RoutePlannerStateLoaded extends RoutePlannerState {
  final Trip trip;
  RoutePlannerStateLoaded({required this.trip});
}

class RoutePlannerStateError extends RoutePlannerState {}
