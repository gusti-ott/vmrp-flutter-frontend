import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:multimodal_routeplanner/functions.dart';

class RoutePlannerPage extends StatefulWidget {
  const RoutePlannerPage({Key? key}) : super(key: key);

  @override
  State<RoutePlannerPage> createState() => _RoutePlannerPageState();
}

class _RoutePlannerPageState extends State<RoutePlannerPage> {
  var pointsRoute = <LatLng>[];
  var data;

  String startAddress = "";
  String endAddress = "";

  /* String startLat = "48.1663835";
  String startLon = "11.5752574";
  String endLat = "48.1336151";
  String endLon = "11.5938114";
  String mode = "EMMY"; */

  String mode = "";

  var url;
  var output = "";
  //String output = 'Initial Output';

  bool _visible = false;

  bool _carState = false;
  bool _ecarState = false;
  bool _bikeState = false;
  bool _ebikeState = false;
  bool _mopedState = false;
  bool _emopedState = false;
  bool _ptState = false;
  bool _cabState = false;
  bool _tierState = false;
  bool _emmyState = false;
  bool _flinksterState = false;
  bool _drivenowState = false;
  bool _intermodalBikeState = false;
  bool _intermodalCabState = false;

  //results
  double _distance = 0.0;
  double _duration = 0.0;
  double _externalCosts = 0.0;

  List resultsList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                plugins: [
                  TappablePolylineMapPlugin(),
                ],
                center: LatLng(48.1662627, 11.5768211),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                /* MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 25.0,
                      height: 25.0,
                      point: LatLng(48.1662627, 11.5768211),
                      builder: (ctx) => const FlutterLogo(),
                    ),
                  ],
                ), */
                TappablePolylineLayerOptions(
                    polylineCulling: true,
                    polylines: [
                      TaggedPolyline(
                          points: pointsRoute,
                          tag: "My Poliline",
                          strokeWidth: 5),
                    ],
                    onTap: (polylines, tapPosition) => print('Tapped: ' +
                        polylines.map((polyline) => polyline.tag).join(',') +
                        ' at ' +
                        tapPosition.globalPosition.toString()),
                    onMiss: (tapPosition) {
                      print('No polyline was tapped at position ' +
                          tapPosition.globalPosition.toString());
                    }),
              ],
            ),
            Container(
              width: 300,
              color: Colors.purple.withOpacity(0.7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                    child: TextField(
                      onChanged: ((value) {
                        setState(() {
                          startAddress = value.toString();
                        });
                      }),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Startadresse",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: TextField(
                      onChanged: ((value) {
                        setState(() {
                          endAddress = value.toString();
                        });
                      }),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Zieladresse",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(children: const [
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text("private Fahrzeuge"),
                      ),
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _carState = !_carState;
                            });
                            String mode = 'CAR';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_car_filled,
                          ),
                          tooltip: 'Pkw',
                          color: _carState ? Colors.black : Colors.white),
                      IconButton(
                          hoverColor: Colors.white,
                          splashColor: Colors.blue,
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _bikeState = !_bikeState;
                            });
                            String mode = 'BIKE';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_bike,
                          ),
                          tooltip: 'Fahrrad',
                          color: _bikeState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _mopedState = !_mopedState;
                            });
                            String mode = 'MOPED';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.moped,
                          ),
                          tooltip: 'Moped',
                          color: _mopedState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _ptState = !_ptState;
                            });
                            String mode = 'MVG';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_bus,
                          ),
                          tooltip: 'Öffis',
                          color: _ptState ? Colors.black : Colors.white),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(children: const [
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text("sharing Fahrzeuge"),
                      ),
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _cabState = !_cabState;
                            });
                            String mode = 'CAB';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_bike_sharp,
                          ),
                          tooltip: 'Call a Bike',
                          color: _cabState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _emmyState = !_emmyState;
                            });
                            String mode = 'EMMY';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.pedal_bike_sharp,
                          ),
                          tooltip: 'Emmy',
                          color: _emmyState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _tierState = !_tierState;
                            });
                            String mode = 'TIER';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.electric_scooter,
                          ),
                          tooltip: 'Tier',
                          color: _tierState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _flinksterState = !_flinksterState;
                            });
                            String mode = 'FLINKSTER';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.car_rental,
                          ),
                          tooltip: 'Flinkster',
                          color: _flinksterState ? Colors.black : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _drivenowState = !_drivenowState;
                            });
                            String mode = 'SHARENOW';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.car_rental,
                          ),
                          tooltip: 'ShareNow',
                          color: _drivenowState ? Colors.black : Colors.white),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(children: const [
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text("intermodal"),
                      ),
                      Expanded(
                          child: Divider(thickness: 3, color: Colors.black)),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _intermodalBikeState = !_intermodalBikeState;
                            });
                            String mode = 'INTERMODAL_BIKE';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_bike,
                          ),
                          tooltip: 'Intermodal mit Fahrrad',
                          color: _intermodalBikeState
                              ? Colors.black
                              : Colors.white),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              _visible = false;
                              resetAllStates();
                              _intermodalCabState = !_intermodalCabState;
                            });
                            String mode = 'INTERMODAL_CAB';
                            var decodedData = await onIconPress(
                                startAddress, endAddress, mode);
                            List<LatLng> points = getPoints(decodedData);
                            _updateRouteVisual(points);

                            setState(() {
                              _distance = getDistance(decodedData);
                              _duration = getDuration(decodedData);
                              _externalCosts = getExternalCosts(decodedData);
                              _visible = true;
                            });
                          },
                          icon: const Icon(
                            Icons.directions_bike,
                          ),
                          tooltip: 'Intermodal Call a Bike',
                          color: _intermodalCabState
                              ? Colors.black
                              : Colors.white),
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Distanz: ',
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: _distance.toStringAsFixed(2),
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
                                  text: _duration.toStringAsFixed(2),
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
                                  text: _externalCosts.toStringAsFixed(2),
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateRouteVisual(List<LatLng> points) {
    setState(() {
      pointsRoute = points;
    });
  }

  carPressed() {
    print("Car pressed");
  }

  void resetAllStates() {
    setState(() {
      _carState = false;
      _bikeState = false;
      _mopedState = false;
      _ptState = false;
      _cabState = false;
      _tierState = false;
      _emmyState = false;
      _flinksterState = false;
      _drivenowState = false;
      _intermodalBikeState = false;
      _intermodalCabState = false;
    });
  }
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

_getResult(selectedMode) {
  //- fetch data
  //- get waypoints, distance, duration, externalCosts
  //- save results in key value pairs
  //- return result
}

_getAllResults(List availableModes) {
  //- fetch data
  //- for loop over selected Modes
  //- get waypoints, distance, duration, externalCosts
  //- save results in List of key value pairs
}
