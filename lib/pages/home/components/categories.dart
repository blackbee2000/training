import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training/utils/size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "asset/icons/ic_gift.svg", "text": "Flash Deal"},
      {"icon": "asset/icons/ic_gift.svg", "text": "Bill"},
      {"icon": "asset/icons/ic_gift.svg", "text": "Game"},
      {"icon": "asset/icons/ic_gift.svg", "text": "Daily Gift"},
      {"icon": "asset/icons/ic_gift.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
