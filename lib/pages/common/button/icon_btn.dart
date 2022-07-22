import 'package:flutter/material.dart';
import 'package:training/utils/app_color.dart';
import 'package:training/utils/size_config.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.color = AppColor.primary,
    this.backgroundColor = AppColor.greyLight,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: color,
          backgroundColor: backgroundColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
