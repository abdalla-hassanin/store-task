import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_task/controllers/app_controller.dart';
import 'package:store_task/controllers/services/dio_helper.dart';
import 'package:store_task/views/screen/cart_screen.dart';
import 'package:store_task/views/screen/product_screen.dart';
import 'package:store_task/views/utils/strings.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key}) : super(key: key);
   final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.appName),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor:Colors.blue ,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
Get.to(()=> CartScreen());
          }, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body:Obx(() =>GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return buildCategoryItem(context,controller.categoryItems[index]);
        },
        itemCount: controller.categoryItems.length,
      )));
  }
  Widget buildCategoryItem(BuildContext context,String text) {
    return InkWell(
      onTap: () {
        Get.to(()=> ProductScreen(categoryName: text));
        },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
