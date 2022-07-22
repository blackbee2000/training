import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/home/home_controller.dart';
import 'package:training/pages/common/header/header_search.dart';
import 'package:training/pages/home/components/banner.dart';
import 'package:training/pages/home/components/categories.dart';
import 'package:training/pages/home/components/specials.dart';
import 'package:training/pages/product/components/products.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: Get.nestedKey(AppConstant.HOME),
        onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (_) => Container(
                height: SizeConfig.screenHeight,
                child: GetBuilder<HomeController>(
                    builder: (controller) => SafeArea(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: getProportionateScreenWidth(8),
                              ),
                              HeaderSearch(),
                              SizedBox(
                                height: getProportionateScreenWidth(8),
                              ),
                              BannerHome(),
                              SizedBox(
                                height: getProportionateScreenWidth(2),
                              ),
                              Categories(),
                              Specials(),
                              SizedBox(
                                height: getProportionateScreenWidth(8),
                              ),
                              Products(
                                products: controller.products,
                              ),
                            ],
                          ),
                        ))),
              ),
            ));
  }
}
