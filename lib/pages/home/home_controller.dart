import 'package:get/get.dart';
import 'package:training/pages/apis/home/home_api.dart';
import 'package:training/pages/models/product/product.dart';

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
