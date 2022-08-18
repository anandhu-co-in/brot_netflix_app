import 'package:brot_netflix_app/core/constants.dart';
import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
