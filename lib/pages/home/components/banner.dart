import 'package:flutter/material.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/size_config.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      child: Text.rich(TextSpan(
          text: "Ngày hội thanh lý đồ cũ \n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Khuyễn mãi hơn 38%",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ])),
    );
  }
}
