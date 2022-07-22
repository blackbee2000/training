import 'package:flutter/material.dart';
import 'package:training/pages/common/header/search_field.dart';
import 'package:training/utils/size_config.dart';
import 'icon_btn_with_counter.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
            IconBtnWithCounter(
              icon: "asset/icons/ic_filter.svg",
              press: () {},
            ),
            IconBtnWithCounter(
              icon: "asset/icons/ic_bell.svg",
              numOfitem: 3,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
