import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/widgets/row_of_cards_with_title.dart';
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
              RowOfNumberCardsWithTitle(
                title: "Top 10 in India Today (Number Cards)",
              ),
              kHeight,
              RowOfCardsWithTitle(
                title: "Tense Dramas",
              ),
              kHeight,
              RowOfCardsWithTitle(
                title: "South Indian Cinema",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
