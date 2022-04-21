import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
/* 
Future<Route> fetchRoute() async {
  String routeUri =
      'http://127.0.0.1:5000/trips/distance?startLat=48.1663835&startLon=11.5752574&endLat=48.1336151&endLon=11.5938114&mode=MVG';

  final response = await http.get(Uri.parse(routeUri));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Route.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
} */

class Route {
  final double distance;
  final double duration;
  final double externalCosts;
  final List<LatLng> waypoints;

  const Route(
      {required this.distance,
      required this.duration,
      required this.externalCosts,
      required this.waypoints});
}
