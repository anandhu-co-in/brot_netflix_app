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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              MainCardWithNumber(
                number: 1,
              ),
              MainCardWithNumber(
                number: 2,
              ),
              MainCardWithNumber(
                number: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
