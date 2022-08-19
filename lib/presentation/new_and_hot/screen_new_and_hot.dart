import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/new_and_hot/widget/coming_soon_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 35,
                ),
                kWidth,
                Container(
                  color: Colors.blue,
                  width: 30,
                  height: 30,
                ),
                kWidth
              ],
              bottom: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  isScrollable: true,
                  indicator: BoxDecoration(
                      color: Colors.white, borderRadius: borderRadius2),
                  tabs: const [
                    Tab(text: "🍿 Coming Soon"),
                    Tab(text: "👀 Everyone's watching")
                  ]),
            ),
            preferredSize: const Size.fromHeight(90)),
        body: const TabBarView(
          children: [
            ComingSoonTab(),
            EveryOnesWatchingTab(),
          ],
        ),
      ),
    );
  }
}

class ComingSoonTab extends StatelessWidget {
  const ComingSoonTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        kHeight,
        ComingSoonTabRow(),
        ComingSoonTabRow(),
      ],
    );
  }
}

class EveryOnesWatchingTab extends StatelessWidget {
  const EveryOnesWatchingTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("TODO-Everyones watchinge");
  }
}
