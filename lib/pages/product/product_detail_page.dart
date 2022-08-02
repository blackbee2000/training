import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training/controllers/home/layout_controller.dart';
import 'package:training/controllers/product/product_controller.dart';
import 'package:training/models/product/product.dart';
import 'package:training/pages/cart/cart_page.dart';
import 'package:training/pages/common/app_bar/custom_app_bar.dart';
import 'package:training/pages/common/button/icon_btn.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final int id;

  @override
  State<StatefulWidget> createState() => ProductDetailState();

  const ProductDetailPage({Key? key, required this.product, required this.id})
      : super(key: key);
}

class ProductDetailState extends State<ProductDetailPage> {
  final productController = Get.put(ProductController());
  final layoutController = Get.put(LayoutController());
  int selectImage = 0;
  int selectColor = 0;
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
    return GetBuilder<ProductController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(
            id: widget.id,
            child: Row(
              children: [
                Text(
                  "4.3",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                IconBtn(
                  icon: Icons.star,
                  color: Colors.yellow,
                  backgroundColor: Colors.transparent,
                  press: () {},
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImages(),
              TopRoundedContainer(
                  Colors.white,
                  Column(
                    children: [
                      ProductDescription(context),
                      SizedBox(
                        height: 10,
                      ),
                      PersonInfo(),
                      ButtonAddToCart(),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row PersonInfo() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              Container(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://firebasestorage.googleapis.com/v0/b/fir-react-upload-40723.appspot.com/o/images%2Favt_hieunguyen.jpg?alt=media&token=9a4fdb73-741c-42f5-99d1-e6250b43d2b3',
                    useOldImageOnUrlChange: false,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Nguyễn Hiếu Hotboy'),
                Text('197CT22222'),
                Row(
                  children: [
                    Text(
                      'Khu vực: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ĐH Văn Lang CS3',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ])
            ],
          )),
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          width: getProportionateScreenWidth(64),
          decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: SvgPicture.asset("asset/icons/ic_chat.svg",
              color: AppColor.dartblue),
        ),
      ),
    ]);
  }

  Widget ButtonAddToCart() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.15,
        right: SizeConfig.screenWidth * 0.15,
        top: getProportionateScreenWidth(15),
      ),
      child: SizedBox(
        height: getProportionateScreenWidth(36),
        child: ElevatedButton.icon(
            label: const Text(
              'Thêm vào giỏ hàng',
              style: TextStyle(fontSize: 16),
            ),
            icon: Icon(Icons.add),
            onPressed: () async {
              layoutController.tabIndex.value = AppConstant.CART;
              layoutController.update();
              Get.to(CartPage(), id: AppConstant.HOME);
            },
            style: ElevatedButton.styleFrom(
              primary: AppColor.primary,
              onPrimary: Colors.white,
            )),
      ),
    );
  }

  Padding ColorDots() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ColorDot(AppColor.primary, 0),
          ColorDot(AppColor.dartblue, 1),
          Spacer(),
          IconBtn(
            icon: Icons.remove,
            press: () {},
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          IconBtn(
            icon: Icons.add,
            press: () {},
            color: Colors.black,
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }

  GestureDetector ColorDot(Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectColor = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 2),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: selectColor == index
                ? Border.all(color: AppColor.primary)
                : Border.all(color: Color(0xFFF6F7F9))),
        child: DecoratedBox(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      ),
    );
  }

  Column ProductDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // product name
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            '${widget.product.name}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        // product price and button like
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                '${widget.product.price}',
                style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  liked = !liked;
                });
              },
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(64),
                decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: SvgPicture.asset("asset/icons/ic_heart_2.svg",
                    color: liked ? Color(0xFFFF4848) : Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // product descrtion
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20)),
          child: ExpandableText(
              '${widget.product.desc} ${widget.product.desc} ${widget.product.desc} ${widget.product.desc} ${widget.product.desc}\n',
              expandText: 'Xem thêm',
              collapseText: 'Thu nhỏ',
              maxLines: 10,
              linkColor: AppColor.primary),
        ),
        SizedBox(
          height: 10,
        ),
        // product status and category
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  'Tình trạng: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.product.statusName}',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  'Loại sản phẩm: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.product.categoryName}',
                  style: TextStyle(),
                ),
              ],
            ),
          )
        ]),
      ],
    );
  }

  Container TopRoundedContainer(Color color, Widget child) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: child,
    );
  }

  Column ProductImages() {
    return Column(children: [
      SizedBox(
        width: getProportionateScreenWidth(200),
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: '${widget.product.images[selectImage]}',
            useOldImageOnUrlChange: false,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              height: 15,
              width: 15,
              child: Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              widget.product.images.length, (index) => ImageSmallPreview(index))
        ],
      )
    ]);
  }

  GestureDetector ImageSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    index == selectImage ? AppColor.primary : AppColor.grey)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: '${widget.product.images[index]}',
          useOldImageOnUrlChange: false,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
