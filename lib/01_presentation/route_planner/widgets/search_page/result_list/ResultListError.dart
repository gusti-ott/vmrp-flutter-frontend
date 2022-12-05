import 'package:flutter/material.dart';

class ResultListError extends StatelessWidget {
  final String message;
  const ResultListError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
