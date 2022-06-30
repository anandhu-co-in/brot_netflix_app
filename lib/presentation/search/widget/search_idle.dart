import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:flutter/material.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Top Searches",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return TopSearchTileItem();
              },
              separatorBuilder: (ctx, index) {
                return kHeight;
              },
              itemCount: 210),
        )
      ],
    );
  }
}

class TopSearchTileItem extends StatelessWidget {
  const TopSearchTileItem({Key? key}) : super(key: key);

  final imageUrl =
      "https://www.mmppicture.co.in/wp-content/uploads/2020/07/The-Hero-Action-Movie-Poster.jpg";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
            // color: Colors.red,
            width: screenWidth * .3,
            height: screenWidth * .22,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            )),
        kWidth,
        const Expanded(
          //Without this expand, when long movie names, there is overflow. Why? dont ask me!
          child: Text(
            'Movie Name',
            style: TextStyle(
                color: textWhite, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        kWidth,
        const Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.white,
          size: 40,
        )
        // TODO - the original icon had thinner outlines, etc maybe create on our own using circle avarat?
      ],
    );
  }
}

// NOTE
// Fixed that listview height issues. But i need to further understand how it works
// TODO - Start designing the search results screen next
