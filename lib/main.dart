import 'package:flutter/material.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner_page.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';

//some change

import 'package:multimodal_routeplanner/functions.dart';

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
    return RoutePlannerPage();
  }
}
