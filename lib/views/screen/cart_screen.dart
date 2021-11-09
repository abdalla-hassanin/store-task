import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_task/controllers/app_controller.dart';
import 'package:store_task/models/product_model.dart';
import 'package:store_task/views/component/item_counter.dart';
import 'package:store_task/views/component/shared.dart';
import 'package:store_task/views/utils/strings.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConst.myCart),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {}, child: const Text(StringConst.checkOut))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
              itemBuilder: (context, index) => buildListCard(context),
              separatorBuilder: (context, index) => buildDivider(1),
              itemCount: 5),
        ));
  }

  Widget buildListCard(context) {
    ThemeData theme = Theme.of(context);
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
            ),
          ),
          buildSpaceW(8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
                style: theme.textTheme.headline6,
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
                  Text('654', style: theme.textTheme.subtitle2)
                ],
              ),
              buildSpaceH(8),
              ItemCounter(
                onAmountChanged: (newAmount) {},
              )
            ],
          ))
        ],
      ),
    ]);
  }
}
