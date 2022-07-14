import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/pages/components/header/header_search.dart';
import 'package:training/pages/components/home/section_title.dart';
import 'package:training/pages/components/home/slider_image.dart';
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
                    SectionTitle(
                      text: 'Sản phẩm nổi bật',
                      press: () {},
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SliderImage(),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          SliderImage(),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          SliderImage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
