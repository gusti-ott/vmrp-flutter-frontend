import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multimodal_routeplanner/02_application/bloc/dummy_variables.dart';

import '../../03_domain/entities/Trip.dart';

part 'route_planner_event.dart';
part 'route_planner_state.dart';

class RoutePlannerBloc extends Bloc<RoutePlannerEvent, RoutePlannerState> {
  DummyVariables dummy = DummyVariables();

  RoutePlannerBloc() : super(RoutePlannerInitial()) {
    Future sleep1() {
      return Future.delayed(const Duration(seconds: 2), () => "1");
    }

    on<RoutePlannerEvent>((event, emit) async {
      emit(RoutePlannerStateLoading());

      // do something
      await sleep1();
      // get route result

      Trip dummyTrip = dummy.getTrip();

      emit(RoutePlannerStateLoaded(trip: dummyTrip));
    });
  }
}
