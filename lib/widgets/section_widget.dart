import 'package:flutter/material.dart';
import 'package:quotes/model/category.dart';
import 'package:quotes/widgets/quote_card_widget.dart';

class SectionWidget extends StatelessWidget {
  final Category ?section;
   SectionWidget({required this.section, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 260,
     margin: EdgeInsets.all(5),
     padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Text(section!.name)),
        Container(
          height: 210,
          width: double.infinity,
          child: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // number of items in each row
    childAspectRatio: 0.7
    // mainAxisSpacing: 0, // spacing between rows
    // crossAxisSpacing: 8.0, // spacing between columns
  ),
  // padding: EdgeInsets.all(8.0), // padding around the grid
  itemCount: 9, // total number of items
  scrollDirection: Axis.horizontal,
  itemBuilder: (context, index) {
    return QuoteCardWidget();
  },
)
        )
      ]),
    );
  }
}
