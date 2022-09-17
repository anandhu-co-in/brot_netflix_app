import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

final _dummyVideoURLs = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

// Inherited widget class created for passing data to child widgets if i am not wrong
class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;

    final videoUrl = _dummyVideoURLs[index % _dummyVideoURLs.length];

    return Stack(
      children: [
        // Container(color: Colors.grey),
        VideoPlayerWidget(
          videoUrl: videoUrl,
          onStateChanged: (bool isPlaying) {},
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0, // On setting right also along with left, the row expanded!
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_off_outlined,
                      size: 25,
                    ),
                    onPressed: () {
                      print("TODO - Volume icon on press not implemented");
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // $imageAppendURL${item.posterPath}
                    // posterPath!=null?Text('$imageAppendURL$posterPath'):Text("posterpathNUll"),

                    posterPath != null
                        ? CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage('$imageAppendURL$posterPath'),
                          )
                        : Text("posterpathNUll"),
                    kHeight,
                    const VideoListCirlceButton(
                      icon: Icons.emoji_emotions_rounded,
                      label: 'Lol',
                    ),
                    kHeight,
                    const VideoListCirlceButton(
                      icon: Icons.add,
                      label: 'My List',
                    ),
                    kHeight,
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .title;
                        print("Clicked share icon");
                        Share.share(
                            "Movie name $movieName - replace this url/description/link whatever as you required");
                      },
                      child: const VideoListCirlceButton(
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ),
                    kHeight,
                    const VideoListCirlceButton(
                      icon: Icons.play_arrow,
                      label: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoListCirlceButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const VideoListCirlceButton(
      {Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  const VideoPlayerWidget(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    print("Disposing video player controlller");
    _videoPlayerController.dispose();
    super.dispose();
  }
}
