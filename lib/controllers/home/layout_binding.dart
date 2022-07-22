import 'package:get/get.dart';
import 'package:training/controllers/auth/login_controller.dart';
import 'package:training/controllers/cart/cart_controller.dart';
import 'package:training/controllers/chat/chat_controller.dart';
import 'package:training/controllers/home/home_controller.dart';
import 'package:training/controllers/profile/profile_controller.dart';

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
