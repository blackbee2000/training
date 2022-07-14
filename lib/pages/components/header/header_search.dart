import 'package:flutter/material.dart';
import 'package:training/pages/components/header/search_field.dart';
import 'package:training/pages/utils/size_config.dart';

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
              icon: "asset/icons/ic_filter.png",
              press: () {},
            ),
            IconBtnWithCounter(
              icon: "asset/icons/ic_bell.png",
              numOfitem: 3,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
