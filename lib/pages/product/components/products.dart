import 'package:flutter/material.dart';
import 'package:training/models/product/product.dart';
import 'package:training/pages/home/components/section_title.dart';
import 'package:training/pages/product/components/product_card.dart';
import 'package:training/utils/size_config.dart';

class Products extends StatelessWidget {
  const Products(
      {Key? key, required this.products, this.type = 'SingleChildScrollView'})
      : super(key: key);

  final List<Product> products;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Sản phẩm phổ biến", press: () {}),
        SizedBox(
          height: getProportionateScreenWidth(8),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  products.length,
                  (index) => ProductCard(
                        product: products[index],
                      )),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(8),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(products.length,
                  (index) => ProductCard(product: products[index])),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(8),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(products.length,
                  (index) => ProductCard(product: products[index])),
            ],
          ),
        )
      ],
    );
  }
}
