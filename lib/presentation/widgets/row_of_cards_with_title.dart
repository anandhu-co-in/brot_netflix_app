import 'package:brot_netflix_app/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';

import 'main_card.dart';

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
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              5,
              (index) => MainCard(),
            ),
          ),
        )
      ],
    );
  }
}

class RowOfNumberCardsWithTitle extends StatelessWidget {
  final String title;
  const RowOfNumberCardsWithTitle({Key? key, required this.title})
      : super(key: key);

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

        // I had to use this limited box when i changed to Listview, need to explore this widget more
        // Something related to set limited when parent has unbounded blah blah..
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => MainCardWithNumber(
                number: index + 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
