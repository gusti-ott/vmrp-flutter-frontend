part of 'route_planner_bloc.dart';

@immutable
abstract class RoutePlannerEvent {}

/// event when mobility mode is selected
class RouteRequestedEvent extends RoutePlannerEvent {}
