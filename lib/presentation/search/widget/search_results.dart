import 'package:brot_netflix_app/blocs/search/search_bloc.dart';
import 'package:brot_netflix_app/blocs/search/search_bloc.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/search/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                //This decides the height and width of the gridview cards
                children: List.generate(
                  state.searchResultList.length,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(imageUrl: movie.getPosterPathUrl());
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);

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
