import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/model/category.dart';

class AddEditSecitonScreen extends StatelessWidget {
  // Category category;
  String mode;
  AddEditSecitonScreen({ 
    // this.category,
   required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$mode Quote')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            color: AppColors.primary,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Text(
                //     "LOGIN",
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                //   ),
                // ),
                Container(
                  height: 100,
                  child: Icon(Icons.quora_outlined),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(10),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     border: Border.all(color: AppColors.secondry, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "please login or sign up for easy shopping",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                EditSecitonScreenWidget(
                  // category: category
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditSecitonScreenWidget extends StatefulWidget {
  // Category category;
  EditSecitonScreenWidget({
    // required this.category, 
    super.key});

  @override
  State<EditSecitonScreenWidget> createState() =>
      _EditSecitonScreenWidgetState();
}

class _EditSecitonScreenWidgetState extends State<EditSecitonScreenWidget> {
  final _formKey = GlobalKey<FormState>();
  String? initValue;
  final TextEditingController sectionEditController = TextEditingController();

  @override
  void initState() {
    // initValue = widget.category.name;
    super.initState();
  }

  @override
  void dispose() {
    sectionEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // DropdownButtonFormField(decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blue),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     hintText: 'Enter your name',
            //   ),
            //   items: [
            //   DropdownMenuItem(
            //     child: Text('Item 1'),
            //     value: 1,
            //   ),
            // ], onChanged: (n) {}),
            TextFormField(
              controller: sectionEditController,
              maxLines: 1,
              // initialValue: 'test',
              decoration: InputDecoration(
                labelText: 'Enter Section Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ادخل قيمة ';
                }
                if (value.length > 15) {
                  return 'ادخل اسم اقم من 15 حرف';
                }
                return null;
              },
              onChanged: (value) {},
              onSaved: (newValue) {},
            ),

            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                Get.find<CategoryController>().createSection(name: sectionEditController.text.toString());
                Get.back();
                }
              },
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.secondry),
                  child: Text('حفظ',style: TextStyle(color: AppColors.primary,fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }
}
