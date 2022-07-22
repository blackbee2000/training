import 'package:get/get.dart';
import 'package:training/models/product/product.dart';

import 'home_api.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getProducts();
  }

  getProducts() {
    HomeApi().getProducts(
        params: {},
        beforeSend: () {},
        onSuccess: (response) {
          print('Home Controller');
          print(response.record);
          products.value = response.record ?? [];
          try {} catch (error) {}
          update();
        },
        onError: (e) {});
  }
}
