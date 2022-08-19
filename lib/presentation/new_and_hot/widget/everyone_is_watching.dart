import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/home/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';

class EveryOnesWatchingTabRow extends StatelessWidget {
  const EveryOnesWatchingTabRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Kaduva",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: textWhite),
        ),
        kHeight,
        const Text(
          "Ross chooses between Rachel and his bald-headed girlfriend Bonnie. Phoebe struggles to deal with the revelation that her mother's friend is actually her mother. Monica gets stung by a jellyfish, forcing Chandler and Joey to step up to the plate in order to relieve her pain.",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),
        ),
        kHeight,
        Stack(
          children: [
            Container(
              width: double.infinity,
              // color: Colors.red,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://english.mathrubhumi.com/image/contentid/policy:1.7641860:1656339815/Kaduva%20Poster.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.volume_off,
                  size: 25,
                ),
                onPressed: () {
                  print("TODO - Volume icon on press not implemented");
                },
              ),
            )
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            CustomIconButton(icon: Icons.share, label: "Share"),
            kWidth,
            CustomIconButton(icon: Icons.add, label: "My List"),
            kWidth,
            CustomIconButton(icon: Icons.play_arrow, label: "Play"),
            kWidth
          ],
        ),
      ],
    );
  }
}
