import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/pages/common/header/header_search.dart';
import 'package:training/pages/home/component/section_title.dart';
import 'package:training/pages/home/component/specials.dart';
import 'package:training/pages/models/product/compoments/product_card.dart';
import 'package:training/pages/utils/size_config.dart';

import 'home_controller.dart';

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
    return Container(
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
                    Specials(),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    SectionTitle(text: "Danh mục 1", press: () {}),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              controller.products.length,
                              (index) => ProductCard(
                                  product: controller.products[index])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              controller.products.length,
                              (index) => ProductCard(
                                  product: controller.products[index])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              controller.products.length,
                              (index) => ProductCard(
                                  product: controller.products[index])),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
