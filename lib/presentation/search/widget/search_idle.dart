import 'package:flutter/material.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Search",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return Text('Listviw item');
              },
              separatorBuilder: (ctx, index) {
                return Text('Separator');
              },
              itemCount: 210),
        )
      ],
    );
  }
}

// NOTE
// Fixed that listview height issues. But i need to further understand how it works
// TODO
// Populate the listview
