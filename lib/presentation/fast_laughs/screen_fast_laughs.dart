import 'package:brot_netflix_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget(
            title: 'Fast Laughs',
          ),
          preferredSize: Size.fromHeight(50)),
    );
  }
}
