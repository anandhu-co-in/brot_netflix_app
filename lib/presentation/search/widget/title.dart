import 'package:flutter/material.dart';

class SearchesTitle extends StatelessWidget {
  final String title;
  const SearchesTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
