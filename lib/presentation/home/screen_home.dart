import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/home/widget/custom_icon_button.dart';
import 'package:brot_netflix_app/presentation/widgets/row_of_cards_with_title.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingPage,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(mainImage), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CustomIconButton(
                        icon: Icons.add,
                        label: 'My List',
                      ),
                      PlayButton(),
                      CustomIconButton(
                        icon: Icons.info,
                        label: 'Info',
                      ),
                    ],
                  ),
                )
              ],
            ),
            kHeight,
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
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          print("Button action not implemented");
        },
        // This is how to set colour for testbutton.icon
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        icon: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}

// TODO - Refractor the top box did today into separate file in widgets
// TODO - Implement scrolling for the top box - video timestamp 23:02
