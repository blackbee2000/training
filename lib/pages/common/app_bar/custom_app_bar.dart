import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/pages/common/button/icon_btn.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final int id;
  final Widget child;

  CustomAppBar({required this.id, required Widget this.child});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: IconBtn(
                icon: Icons.arrow_back_ios_new_rounded,
                backgroundColor: Colors.white,
                press: () {
                  print("CustomAppBar");
                  Get.back(id: id);
                },
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
