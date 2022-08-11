import 'package:bordered_text/bordered_text.dart';
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
        height: 190,
        width: 140,
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

// Sized box and image container in a row with a number positioned on top
class MainCardWithNumber extends StatelessWidget {
  final int number;

  const MainCardWithNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              Container(
                height: 190,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: borderRadius1,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/ed4796ac6feff9d2a6115406f964c928_6b200bda-fe71-4900-ad7f-903cdda50dab_240x360_crop_center.progressive.jpg?v=1573587596"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
          Positioned(
              bottom:
                  -30, // TODO - Why doesn't setting this 0 put the number on bottom?
              left: 0,
              child: BorderedText(
                strokeWidth: 10.0,
                strokeColor: Colors.white,
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                      fontSize: 140,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.white,
                      color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}

// TODO - Start with next home section, replace the main padding of downloads(and other pages if any) with page padding
// TODO - Change the font family in the number cards
// TODO - Change to listview (i think) with that loop
// TODO - Analyse Why doesn't setting this 0 put the number on bottom?
