import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/widgets/main_card.dart';
import 'package:brot_netflix_app/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingPage,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              RowOfCardsWithTitle(title: "Released in the Past Year"),
              kHeight,
              RowOfCardsWithTitle(
                title: "Trending Now",
              ),
              kHeight,
              RowOfCardsWithTitle(
                title: "Top 10 in India Today",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowOfCardsWithTitle extends StatelessWidget {
  final String title;
  const RowOfCardsWithTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.red,
          child: SectionTitle(
            title: title,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              MainCard(),
              MainCard(),
              MainCard(),
              MainCard(),
            ],
          ),
        )
      ],
    );
  }
}

// TODO - Start with next home section, replce the main padding of donwlowds(and other pages if any) with page padding
