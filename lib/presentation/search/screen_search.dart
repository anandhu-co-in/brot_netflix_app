import 'package:brot_netflix_app/blocs/search/search_bloc.dart';
import 'package:brot_netflix_app/presentation/search/widget/search_idle.dart';
import 'package:brot_netflix_app/presentation/search/widget/search_results.dart';
import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // To call function after this widget is built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("Called WidgetsBinding.instance!.addPostFrameCallback");
      BlocProvider.of<SearchBloc>(context).add(const SearchEvent.initialize());
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {

                // To trigger is i backspace all the text
                if (value.isEmpty) {
                  BlocProvider.of<SearchBloc>(context).add(const SearchEvent.initialize());
                  return;
                }
                print('Search on change $value');
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchEvent.searchMovies(movieQuery: value));
              },
              backgroundColor: Colors.grey.withOpacity(.4),
              style: TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return SearchIdleWidget();
                  }
                  return SearchResults();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
