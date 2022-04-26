import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/route_planner_page.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_planner_bloc.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';

//some change

import 'package:multimodal_routeplanner/functions.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Route Planner',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: BlocProvider(
            create: (BuildContext context) => RoutePlannerBloc(),
            child: const RoutePlannerPage()));
  }
}
