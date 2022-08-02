import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/cart/cart_controller.dart';
import 'package:training/pages/common/app_bar/custom_app_bar.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class CartPage extends StatefulWidget {
  // final int id;

  @override
  State<StatefulWidget> createState() => CartState();

  const CartPage({Key? key}) : super(key: key);
}

class CartState extends State<CartPage> {
  final cartController = Get.put(CartController());

  bool liked = false;

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
    return GetBuilder<CartController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                  child: CustomAppBar(
                    id: AppConstant.CART,
                    child: SizedBox.shrink(),
                  )),
              body: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(88),
                    ),
                    Text("Cart")
                  ],
                )
              ])),
            ));
  }
}
