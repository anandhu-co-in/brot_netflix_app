import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomIconButton({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(label)
      ],
    );
  }
}
