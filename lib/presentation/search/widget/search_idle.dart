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
        // ListView.separated(
        //     shrinkWrap: true,
        //     itemBuilder: (ctx, index) {
        //       return Text('Listviw item');
        //     },
        //     separatorBuilder: (ctx, index) {
        //       return Text('Separator');
        //     },
        //     itemCount: 133)
      ],
    );
  }
}

//TODO
// Fix the listview overflow issue! i have commented out that part temporarily
