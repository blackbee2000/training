import 'package:get/get.dart';
import 'package:training/pages/profile/profile_controller.dart';

import '../auth/login_controller.dart';
import '../cart/cart_controller.dart';
import '../chat/chat_controller.dart';
import '../home/home_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
