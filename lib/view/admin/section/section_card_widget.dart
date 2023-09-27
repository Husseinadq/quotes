// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/model/category.dart';
import 'package:quotes/view/admin/section/edit_section_screen.dart';

// ignore: must_be_immutable
class SectionCartWidget extends StatelessWidget {
  Category item;
  SectionCartWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.find<ProductController>().getSinglProducts(item.productId!),
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 5,
                spreadRadius: 0.0,
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
            color: Colors.black),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(motion: BehindMotion(), children: [
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //       padding: EdgeInsets.symmetric(
            //           horizontal: 20,
            //           vertical: 30),
            //       color: AppColors.secondry,
            //       child: Icon(
            //         Icons.share,
            //         color: Colors.white,
            //         size: 30,
            //       )),
            // ),
            GestureDetector(
              onTap: () {
                // Get.find<CartController>().removeFromCart(item.id!);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                color: AppColors.secondry,
                child: Icon(
                  Icons.delete,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
            ),
          ]),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary),
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        child: Text(
                          // 'd'
                          item.name.toString(),
                          // color: AppColors.secondryAccent,
                        ),
                      ),
                      Container(
                        // width: Dimensions.width200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(item.id,style: TextStyle(fontSize: 10),))),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.primary,
                                ),
                                child: SwitchWidget(status: item.status))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(AddEditSecitonScreen(mode: 'Edit'
                    // ,category: item
                    ,));
                  },
                  child: Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.edit)),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  bool status;
  SwitchWidget({required this.status, super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
          inactiveThumbColor: AppColors.primary,
          inactiveTrackColor: AppColors.grey,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.secondry,
          value: widget.status,
          onChanged: (value) {
            //TODO function
            setState(() {
              widget.status = value;
            });
          },
        );

    // Switch(
    //  activeColor: AppColors.secondry,
    //  activeTrackColor: AppColors.grey,
    //  inactiveThumbColor: AppColors.grey,
    //  inactiveTrackColor: AppColors.grey,
    //   value: widget.status,
    //   onChanged: (value) {
    //     //TODO function
    //     setState(() {
    //       widget.status = value;
    //     });
    //   },
    // );
  }
}
