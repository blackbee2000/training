import 'package:flutter/material.dart';
import 'package:training/pages/home/component/section_title.dart';
import 'package:training/pages/home/component/slider_image.dart';
import 'package:training/pages/utils/size_config.dart';

class Specials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
