import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/search/widget/title.dart';
import 'package:flutter/material.dart';

final imageUrl =
    "https://www.mmppicture.co.in/wp-content/uploads/2020/07/The-Hero-Action-Movie-Poster.jpg";

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        SearchesTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 /
                1.4, //This decides the height and width of the gridview cards
            children: List.generate(17, (index) => MainCard()),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

// I need to understand how expanding works, say eg, when applying on a gridview etc
// TODO - Start with Fast Laughs page work
