import 'package:brot_netflix_app/core/constants.dart';
import 'package:flutter/material.dart';

// Eg the cards used under "Released in Past Year"
class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 200,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: borderRadius1,
            image: const DecorationImage(
                image: NetworkImage(
                    "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/ed4796ac6feff9d2a6115406f964c928_6b200bda-fe71-4900-ad7f-903cdda50dab_240x360_crop_center.progressive.jpg?v=1573587596"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
