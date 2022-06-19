import 'dart:math';

import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final imagelist = [
    "https://marketplace.canva.com/EAE4sZqehD4/1/0/1131w/canva-gray-%26-black-monochrome-blind-forest-movie-present-poster-PRZ-uOOwgf0.jpg",
    "https://media1.popsugar-assets.com/files/thumbor/z5oKgNC9S4DS6Bay78Aoy5aLO4s/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2017/01/26/813/n/1922283/055dc333c3280d59_BeautyAndTheBeast58726d5b9fac8/i/Beauty-Beast-2017-Movie-Posters.jpg",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180"
  ];

  @override
  Widget build(BuildContext context) {
    //This is how to get the size of screen!
    final screen_size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget(
            title: 'Downloads',
          ),
          preferredSize: Size.fromHeight(50)),
      body: ListView(
        children: [
          Row(
            children: [
              kWidth,
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              kWidth,
              Text("Smart Downloads")
            ],
          ),
          Text("Introducing Downloads for You"),
          Text(
              "We'll download personalized selection of movies and shows for you, so there's always something to watch on your device"),
          Container(
            height: screen_size.width,
            width: screen_size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: screen_size.width * .35,
                ),
                DownloadsImageWidget(
                  imageUrl: imagelist[0],
                  margin: EdgeInsets.only(left: 100, bottom: 50),
                  rotationAngle: 30,
                ),
                DownloadsImageWidget(
                  imageUrl: imagelist[1],
                  margin: EdgeInsets.only(right: 100, bottom: 50),
                  rotationAngle: -30,
                ),
                DownloadsImageWidget(
                  imageUrl: imagelist[2],
                  margin: EdgeInsets.only(right: 0, top: 0),
                  rotationAngle: 0,
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: blueButtonColour,
            child: Text(
              'Set Up',
              style: TextStyle(fontWeight: FontWeight.bold, color: textWhite),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: whiteButtonColour,
            child: Text(
              'See What You Can Download',
              style: TextStyle(fontWeight: FontWeight.bold, color: textBlack),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key, required this.imageUrl, this.margin, this.rotationAngle = 0})
      : super(key: key);

  final imageUrl;
  final double rotationAngle;
  final margin;

  @override
  Widget build(BuildContext context) {
    //This is how to get the size of screen!
    final screen_size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: rotationAngle * pi / 180,
      child: Container(
        margin: margin,
        width: screen_size.width * .4,
        height: screen_size.width * .5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(imageUrl))),
      ),
    );
  }
}

//Pending
//Pass the size as variable to the widget so , i can adjust size of center image separately
