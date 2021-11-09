import 'package:get/get.dart';
import 'package:store_task/controllers/services/dio_helper.dart';
import 'package:store_task/models/product_model.dart';

class AppController extends GetxController {
  var categoryItems = List<String>.empty().obs;
  var productItems = List<ProductModel>.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    getProducts();
  }

  Future<void> getCategories() async {
    categoryItems.clear();
    var getItems = await DioHelper.fetchCategories();
    if (getItems != null) {
      getItems.forEach((item) {
        categoryItems.add(item.toString());
      });
    }
  }

  Future<void> getProducts() async {
    productItems.clear();
    var getItems = await DioHelper.fetchProducts();
    if (getItems != null) {
      getItems.forEach((item) {
        productItems.add(ProductModel.fromJson(item));
      });
    }
  }

}
