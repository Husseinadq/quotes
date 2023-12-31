// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/controller/quote_controller.dart';
import 'package:quotes/model/category.dart';
import 'package:quotes/model/quote.dart';
import 'package:quotes/view/admin/quote/add_edit_quote_screen.dart';
import 'package:quotes/view/admin/section/edit_section_screen.dart';

// ignore: must_be_immutable
class QuoteAdminCartWidget extends StatelessWidget {
  Quote item;
  QuoteAdminCartWidget({
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary),
            height: 150,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          item.context.toString(),
                          // textDirection: TextDirection.rtl,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      item.author,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      // textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 10),
                                    ))),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.primary,
                                  ),
                                  child: SwitchWidget(quote: item)),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.to(AddEditQuoteScreen(mode: 'Edit'
                                  ,quote: item
                                  ,));
                                },
                                child: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(Icons.edit)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  Quote quote;
  SwitchWidget({required this.quote, super.key});

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
      value: widget.quote.status,
      onChanged: (value) {
        setState(() {
          widget.quote.status = value;
          Get.find<QuoteController>().updateQuoteStatus(quote: widget.quote);
        });
      },
    );

  }
}
