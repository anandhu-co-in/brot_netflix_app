import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final clour;
  const VideoListItem({
    Key? key,
    required this.clour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[clour],
    );
  }
}
