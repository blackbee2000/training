import 'package:get/get.dart';
import 'package:training/controllers/home/layout_binding.dart';
import 'package:training/pages/auth/login_page.dart';
import 'package:training/pages/common/layout/layout_page.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => LayoutPage(),
      binding: LayoutBinding(),
    ),
  ];
}

class AppRoutes {
  static const String LOGIN = '/login';
  static const String HOME = '/';
  static const String PRODUCTS = '/products';
  static const String PRODUCT_DETAIL = '/detail';
  static const String CHAT = '/chat';
  static const String PROFILE = '/profile';
  static const String CART = '/profile';
}
