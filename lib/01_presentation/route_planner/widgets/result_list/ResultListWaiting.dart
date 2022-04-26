import 'package:flutter/material.dart';

class ResultListWaiting extends StatelessWidget {
  const ResultListWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return const Center(
      child: CircularProgressIndicator(color: Colors.blue),
    );
  }
}
