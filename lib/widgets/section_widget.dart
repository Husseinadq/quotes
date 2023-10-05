import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/model/category.dart';
import 'package:quotes/widgets/quote_card_widget.dart';

class SectionWidget extends StatelessWidget {
  List<Category>categories;
  final String sectionName;
  SectionWidget({required this.categories,required this.sectionName, super.key});
  @override
  Widget build(BuildContext context) {
    // sectionData=section[sectionName.toString()]!;
    //  section.forEach((element) => print(element.name));
    // return Builder(
        // future: Get.find<CategoryController>()
        //     .getCategoriesDocuments(parentId: section.id),
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return Center(
        //       child: CircularProgressIndicator(
        //         color: AppColors.secondry,
        //       ),
        //     );
        //   }
        //   if (snapshot.hasError) {
        //     return Text("error");
        //   } else {
        //     print("object${snapshot}");
            // print(section.name);
            print('test  null 4');
            return Container(
              height: 260,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5), child: Text(sectionName)),
                    Container(
                        height: 210,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemCount:categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return QuoteCardWidget(
                              title:categories[index].name,
                            );
                          },
                        ))
                  ]),
            );
          }
        // });
  // }
}
