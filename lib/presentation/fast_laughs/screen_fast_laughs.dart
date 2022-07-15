import 'package:brot_netflix_app/presentation/fast_laughs/widget/video_list_item.dart';
import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
            5,
            (index) => VideoListItem(
                  clour: index,
                )),
      ),
    );
  }
}

//TODO  - VideoTileItem, stack..
