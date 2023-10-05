import 'package:flutter/material.dart';
import 'package:quotes/app/color.dart';

class QuoteCardWidget extends StatelessWidget {
  final String title;
  const QuoteCardWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:AppColors.grey,
      child: Container(
        // height: 100,
        // width: 50,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Icon(Icons.quora_outlined)
          ],
        ),
      ),
    );
  }
}
