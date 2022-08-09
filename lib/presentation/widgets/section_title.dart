import 'package:brot_netflix_app/core/colours.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: textWhite),
    );
  }
}
