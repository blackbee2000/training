import 'package:flutter/material.dart';
import 'package:training/utils/size_config.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(children: [
              Image.asset(
                'asset/images/img_banner_1.png',
                fit: BoxFit.cover,
              ),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    Color(0xFF343434).withOpacity(0.4),
                    Color(0xFF343434).withOpacity(0.15)
                  ]))),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(10)),
                  child: Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: "San pham 1\n",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: '18 San pham')
                      ])))
            ]),
          ),
        ));
  }
}
