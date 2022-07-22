import 'package:flutter/material.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.icon,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final String icon;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: AppColor.greyLight,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              icon,
              // width: 32,
              // height: 32,
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
