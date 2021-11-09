import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_task/controllers/app_controller.dart';
import 'package:store_task/models/product_model.dart';
import 'package:store_task/views/component/shared.dart';

class ProductScreen extends StatelessWidget {
  final String categoryName;

  ProductScreen({Key? key, required this.categoryName}) : super(key: key);
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productsInCategory = [];
    for (var product in controller.productItems) {
      if (product.category == categoryName) {
        productsInCategory.add(product);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName.toUpperCase()),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildListCard(context, productsInCategory[index]),
              separatorBuilder: (context, index) => buildDivider(1),
              itemCount: productsInCategory.length),
        ));
  }

  Widget buildListCard(context, ProductModel productModel) {
    ThemeData theme = Theme.of(context);
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              productModel.image!,
            ),
          ),
          buildSpaceW(8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.title!,
                style: theme.textTheme.headline6,
              ),
              buildSpaceH(8),
              Text(
                productModel.description!,
                style: theme.textTheme.subtitle2,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              buildSpaceH(8),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/star_icon.png',
                            height: 14,
                            width: 14,
                          ),
                          buildSpaceW(4),
                          Text(productModel.rating!.rate.toString(),
                              style: theme.textTheme.subtitle2)
                        ],
                      ),
                      buildSpaceH(8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                            Icons.attach_money_outlined,
                            size: 14,
                          ),
                          buildSpaceW(4),
                          Text(productModel.price.toString(),
                              style: theme.textTheme.subtitle2)
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart_outlined))
                ],
              ),
            ],
          ))
        ],
      ),
    ]);
  }
}
