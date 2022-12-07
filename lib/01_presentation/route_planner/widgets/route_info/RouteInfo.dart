import 'package:flutter/material.dart';
import 'package:multimodal_routeplanner/03_domain/entities/Trip.dart';

class RouteInfo extends StatelessWidget {

  final Trip trip;

  const RouteInfo({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Positioned(
      left: 360,
      top: 200,
      child: SizedBox(
        width: 300,
        child: Card(
          color: themeData.colorScheme.onPrimary,
          child: Column(
            children: const [
              Text('erste Zeile'),
              Text('zweite Zeile'),
              Text('dritte Zeile'),
            ],
          ),
        ),
      ),
    );
  }
}
