import 'package:brot_netflix_app/presentation/downloads/screen_downloads.dart';
import 'package:brot_netflix_app/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:brot_netflix_app/presentation/home/screen_home.dart';
import 'package:brot_netflix_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:brot_netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:brot_netflix_app/presentation/search/screen_search.dart';
import 'package:flutter/material.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedBottomNavIndex,
            builder: (context, int index, _) {
              return pages[index];
            }),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
