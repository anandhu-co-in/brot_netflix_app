import 'package:brot_netflix_app/core/constants.dart';
import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final clour;
  const VideoListItem({
    Key? key,
    required this.clour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.accents[clour]),
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
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg"),
                    ),
                    kHeight,
                    VideoListCirlceButton(
                      icon: Icons.emoji_emotions_rounded,
                      label: 'Lol',
                    ),
                    kHeight,
                    VideoListCirlceButton(
                      icon: Icons.add,
                      label: 'My List',
                    ),
                    kHeight,
                    VideoListCirlceButton(
                      icon: Icons.share,
                      label: 'Share',
                    ),
                    kHeight,
                    VideoListCirlceButton(
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
    return GestureDetector(
      onTap: () {
        print("TODO - Click of " + label + " not implemented");
      },
      child: Column(
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
      ),
    );
  }
}
