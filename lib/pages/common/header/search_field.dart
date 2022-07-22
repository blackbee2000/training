import 'package:flutter/material.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
          color: AppColor.greyLight, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Tìm kiếm",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(12)),
        ),
      ),
    );
  }
}
