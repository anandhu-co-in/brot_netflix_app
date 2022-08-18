import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/home/widget/background_card.dart';
import 'package:brot_netflix_app/presentation/widgets/row_of_cards_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ValueNotifier<bool> showTopMenu = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingPage,
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              print("Show");
              showTopMenu.value = true;
            } else if (notification.direction == ScrollDirection.reverse) {
              print("Hide");
              showTopMenu.value = false;
            }
            return true; //return true cancel notification bubbling to parent
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  kHeight,
                  RowOfCardsWithTitle(title: "Released in the Past Year"),
                  kHeight,
                  RowOfCardsWithTitle(
                    title: "Trending Now",
                  ),
                  kHeight,
                  RowOfNumberCardsWithTitle(
                    title: "Top 10 in India Today (Number Cards)",
                  ),
                  kHeight,
                  RowOfCardsWithTitle(
                    title: "Tense Dramas",
                  ),
                  kHeight,
                  RowOfCardsWithTitle(
                    title: "South Indian Cinema",
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: showTopMenu,
                builder: (BuildContext ctx, bool value, _) {
                  return value
                      ? Container(
                          color: Colors.black.withOpacity(.3),
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://www.geekslop.com/wp-content/uploads/2020/06/netflix-logo-letter-n.png",
                                    width: 50,
                                  ),
                                  const Spacer(),
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
                                  kWidth,
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('TV Shows'),
                                  Text('Movies'),
                                  Text('Categories')
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO - (If possible), fade-in/fade-out animation top menu container when scrolling
// TODO - Do New&Hot page
