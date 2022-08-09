import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:brot_netflix_app/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     child: AppBarWidget(
      //       title: 'Home',
      //     ),
      //     preferredSize: Size.fromHeight(50)),

      body: SingleChildScrollView(
        child: Column(
          children: [
            RowOfCards(title: "Released in the Past Year"),
            RowOfCards(
              title: "Trending Now",
            ),
            RowOfCards(
              title: "Top 10 in India Today",
            ),
          ],
        ),
      ),
    );
  }
}

class RowOfCards extends StatelessWidget {
  final String title;
  const RowOfCards({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.red,
          child: SectionTitle(
            title: title,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 200,
                width: 120,
                color: Colors.red,
              ),
              Container(
                height: 200,
                width: 120,
                color: Colors.green,
              ),
              Container(
                height: 200,
                width: 120,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                width: 120,
                color: Colors.grey,
              )
            ],
          ),
        )
      ],
    );
  }
}

// TODO - add padding to the boxes, add picture to the boxes, remove those box colours
