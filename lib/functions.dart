import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

onIconPress(var startAddress, var endAddress, var mode) async {
  // url for chrome
  var url =
      "http://127.0.0.1:5000/test_advanced?inputStart=$startAddress&inputEnd=$endAddress&mode=$mode";

  // url for android emulator
  /* var url =
      "http://10.0.2.2:5000/test_advanced?inputStart=$startAddress&inputEnd=$endAddress&mode=$mode"; */

  var data = await (_fetchdata(url));
  var decoded = jsonDecode(data);
  var waypoints = decoded['waypoints'];

  //print(output);

  var points = <LatLng>[];

  for (var i in waypoints) {
    points.add(LatLng(i['lat'], i['lon']));
  }

  var distance = decoded['distance'];
  var duration = decoded['duration'];
  var externalCosts = decoded['costs'];

  // print("pointsRoute before: " + pointsRoute.toString());

  return decoded;

  // print("points:" + points.toString());
  // print("pointsRoute after: " + pointsRoute.toString());
}

getPoints(var decodedData) {
  var waypoints = decodedData['waypoints'];

  //print(output);

  var points = <LatLng>[];

  for (var i in waypoints) {
    points.add(LatLng(i['lat'], i['lon']));
  }

  return points;
}

getDistance(var decodedData) {
  double distance = decodedData['distance'];
  return distance;
}

getDuration(var decodedData) {
  double duration = decodedData['duration'];
  return duration;
}

getExternalCosts(var decodedData) {
  double externalCosts = decodedData['costs'];
  return externalCosts;
}

_fetchdata(String url) async {
  var headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type",
    "Referrer-Policy": "no-referrer-when-downgrade"
  };

  http.Response response = await http.get(Uri.parse(url), headers: headers);
  return response.body;
}
