import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:training/controllers/home/layout_controller.dart';
import 'package:training/pages/cart/cart_page.dart';
import 'package:training/pages/chat/chat_page.dart';
import 'package:training/pages/home/home_page.dart';
import 'package:training/pages/profile/profile_page.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => LayoutState();
}

class LayoutState extends State<LayoutPage> {
  final controller = Get.put(LayoutController());
  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget buildTitle() {
    return Obx(() => Stack(children: [
          Container(
            height: 60,
            child: CustomNavigationBar(
              iconSize: 24.0,
              // selectedColor: Color(0xff040307),
              // strokeColor: Color(0x30040307),
              opacity: 1,
              elevation: 0,
              backgroundColor: Colors.white,
              items: [
                CustomNavigationBarItem(
                    icon: SvgPicture.asset(
                  'asset/icons/ic_home.svg',
                  width: 32,
                  height: 32,
                  color: controller.tabIndex.value == 0
                      ? AppColor.primary
                      : AppColor.dartblue,
                )),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_cart.svg',
                    width: 32,
                    height: 32,
                    color: controller.tabIndex.value == 1
                        ? AppColor.primary
                        : AppColor.dartblue,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_chat.svg',
                    width: 32,
                    height: 32,
                    color: controller.tabIndex.value == 2
                        ? AppColor.primary
                        : AppColor.dartblue,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_profile.svg',
                    width: 32,
                    height: 32,
                    color: controller.tabIndex.value == 3
                        ? AppColor.primary
                        : AppColor.dartblue,
                  ),
                ),
              ],
              currentIndex: controller.tabIndex.value,
              onTap: (index) {
                if (index == 0) {
                  while (
                      Get.nestedKey(AppConstant.HOME)!.currentState?.canPop() ==
                          true) {
                    Get.nestedKey(AppConstant.HOME)?.currentState?.pop();
                  }
                } else if (index == 1) {
                  while (
                      Get.nestedKey(AppConstant.CART)!.currentState?.canPop() ==
                          true) {
                    Get.nestedKey(AppConstant.CART)?.currentState?.pop();
                  }
                } else if (index == 2) {
                  while (
                      Get.nestedKey(AppConstant.CHAT)!.currentState?.canPop() ==
                          true) {
                    Get.nestedKey(AppConstant.CHAT)?.currentState?.pop();
                  }
                } else if (index == 3) {
                  while (Get.nestedKey(AppConstant.PROFILE)!
                          .currentState
                          ?.canPop() ==
                      true) {
                    Get.nestedKey(AppConstant.PROFILE)?.currentState?.pop();
                  }
                }
                controller.tabIndex.value = index;
              },
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [HomePage(), CartPage(), ChatPage(), ProfilePage()],
            )),
        bottomNavigationBar: buildTitle(),
      ),
    );
  }
}
