import 'package:brot_netflix_app/blocs/search/search_bloc.dart';
import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchesTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Is Error"),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("Search Idle List Empty"),
                );
              }

              return ListView.separated(
                  itemBuilder: (ctx, index) {
                    return TopSearchTileItem(
                      item: state.idleList[index],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return kHeight;
                  },
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchTileItem extends StatelessWidget {
  final item;
  const TopSearchTileItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final imageUrl =
      "https://www.mmppicture.co.in/wp-content/uploads/2020/07/The-Hero-Action-Movie-Poster.jpg";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // if(item.title==null){
    //   return Text("$imageAppendURL${item.posterPath}");
    // }

    return Row(
      children: [
        Container(
            // color: Colors.red,
            width: screenWidth * .3,
            height: screenWidth * .22,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$imageAppendURL${item.posterPath}')),
            )),
        kWidth,
        Expanded(
          //Without this expand, when long movie names, there is overflow. Why? dont ask me!
          child: Text(
            item.title == null ? "-- TITLE NULL -- " : item.title,
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
