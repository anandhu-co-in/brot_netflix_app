import 'package:brot_netflix_app/blocs/fastlaugh/fast_laugh_bloc.dart';
import 'package:brot_netflix_app/presentation/fast_laughs/widget/video_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // // To call function after this widget is built
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   BlocProvider.of<FastLaughBloc>(context)
    //       .add(const FastLaughEvent.initialize());
    // });

    BlocProvider.of<FastLaughBloc>(context)
        .add(const FastLaughEvent.initialize());

    return Scaffold(
      body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("is Error true in State"),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text("VideoList is empty"),
            );
          } else {
            print(state.videosList.length);
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                state.videosList.length,
                (index) => VideoListItemInheritedWidget(
                  widget: VideoListItem(
                    key: Key(index.toString()),
                    index: index,
                  ),
                  movieData: state.videosList[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
