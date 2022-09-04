import 'dart:math';

import 'package:brot_netflix_app/blocs/downloads/downloads_bloc.dart';
import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final sections = [const _SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    //This is how to get the size of screen!

    return Scaffold(
        appBar: const PreferredSize(
            child: AppBarWidget(
              title: 'Downloads',
            ),
            preferredSize: Size.fromHeight(50)),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              return sections[index];
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: 3));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final imagelist = [
    "https://marketplace.canva.com/EAE4sZqehD4/1/0/1131w/canva-gray-%26-black-monochrome-blind-forest-movie-present-poster-PRZ-uOOwgf0.jpg",
    "https://media1.popsugar-assets.com/files/thumbor/z5oKgNC9S4DS6Bay78Aoy5aLO4s/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2017/01/26/813/n/1922283/055dc333c3280d59_BeautyAndTheBeast58726d5b9fac8/i/Beauty-Beast-2017-Movie-Posters.jpg",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180"
  ];

  @override
  Widget build(BuildContext context) {
    // To call function after this widget is built
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
    // });

    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());

    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for You",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: textWhite),
        ),
        kHeight,
        const Text(
            "We'll download personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textGrey)),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return Container(
              height: screenSize.width * .8,
              width: screenSize.width,
              child: state.isLoading
                  ? Center(child: Text(state.isLoading.toString()))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenSize.width * .35,
                          backgroundColor: Colors.grey.withOpacity(.5),
                        ),
                        DownloadsImageWidget(
                          imageUrl:
                              '$imageAppendURL${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 165, bottom: 50),
                          rotationAngle: 20,
                          width: screenSize.width * .30,
                          height: screenSize.width * .50,
                        ),
                        DownloadsImageWidget(
                          imageUrl:
                              '$imageAppendURL${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 165, bottom: 50),
                          rotationAngle: -20,
                          width: screenSize.width * .30,
                          height: screenSize.width * .50,
                        ),
                        DownloadsImageWidget(
                          imageUrl:
                              '$imageAppendURL${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(
                              right: 0, top: 0, bottom: 5),
                          rotationAngle: 0,
                          width: screenSize.width * .37,
                          height: screenSize.width * .55,
                        ),
                        Text(state.isLoading.toString())
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          //Wrap in sizedbox+widt like this, to make the child to expand, when inside column
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10,
                right:
                    10), //Added this as the main listview's padding wasn't enough
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              onPressed: () {},
              color: blueButtonColour,
              child: const Text(
                'Set Up',
                style: TextStyle(fontWeight: FontWeight.bold, color: textWhite),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            onPressed: () {},
            color: whiteButtonColour,
            child: const Text(
              'See What You Can Download',
              style: TextStyle(fontWeight: FontWeight.bold, color: textBlack),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.imageUrl,
      this.margin,
      this.rotationAngle = 0,
      this.width,
      this.height})
      : super(key: key);

  final imageUrl;
  final double rotationAngle;
  final margin;
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle * pi / 180,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      ),
    );
  }
}
