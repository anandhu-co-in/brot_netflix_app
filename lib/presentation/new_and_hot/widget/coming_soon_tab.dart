import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/core/constants.dart';
import 'package:brot_netflix_app/presentation/home/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ComingSoonTabRow extends StatelessWidget {
  const ComingSoonTabRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: 50,
          height: 420,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        Container(
          height: 420,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    // color: Colors.red,
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://www.tasteofcinema.com/wp-content/uploads/2018/02/La-La-Land-04-1_.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.volume_off,
                        size: 25,
                      ),
                      onPressed: () {
                        print("TODO - Volume icon on press not implemented");
                      },
                    ),
                  )
                ],
              ),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "TALL GIRL",
                    style: TextStyle(fontSize: 30),
                  ),
                  Spacer(),
                  CustomIconButton(
                    icon: Icons.notifications_none,
                    label: "Remind Me",
                  ),
                  kWidth,
                  CustomIconButton(
                    icon: Icons.info,
                    label: "Info",
                  ),
                  kWidth
                ],
              ),
              kHeight,
              Text("Coming on Friday", style: TextStyle(color: Colors.grey)),
              kHeight,
              Row(
                children: [
                  Image.network(
                    "https://www.geekslop.com/wp-content/uploads/2020/06/netflix-logo-letter-n.png",
                    width: 20,
                  ),
                  Text("FILM")
                ],
              ),
              kHeight,
              const Text("Tall Girl 2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textWhite)),
              kHeight,
              const Text(
                  "Jodi Kreyman deals with her newfound popularity. Her miscommunications, however, start causing rifts with those around her and now she really needs to \"stand tall.\"",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey))
            ],
          ),
        )
      ],
    );
  }
}
