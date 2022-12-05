import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: TextField(
        onChanged: ((value) {}),
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Startadresse",
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }
}
