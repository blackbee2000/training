import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training/models/product/product.dart';
import 'package:training/pages/product/product_detail_page.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/app_constant.dart';
import 'package:training/utils/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetion;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: () {
          Get.to(
              () => ProductDetailPage(
                    product: product,
                    id: AppConstant.HOME,
                  ),
              id: AppConstant.HOME);
        },
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRetion,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: '${product.id}',
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '${product.images[0]}',
                        useOldImageOnUrlChange: false,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
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
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${product.name}',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price}',
                    style: TextStyle(
                        // fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary),
                  ),
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    width: getProportionateScreenWidth(28),
                    height: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                        // color: AppColor.grey.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'asset/icons/ic_heart_2.svg',
                      color: AppColor.grey.withOpacity(0.1),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
