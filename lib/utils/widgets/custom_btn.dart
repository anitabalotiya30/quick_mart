import 'package:flutter/material.dart';

import '../../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final double? paddingH;
  final double? paddingV;
  final double fontSize;
  // final Color? bgColor;
  final VoidCallback? onTap;
  final String text;
  final bool whiteBtn;

  const CustomBtn(
      {super.key,
      this.paddingH,
      this.paddingV,
      // this.bgColor,
      this.onTap,
      this.fontSize = 20,
      this.whiteBtn = false,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(

            //
            padding: EdgeInsets.symmetric(
                horizontal: paddingH ?? mq.width * .3,
                vertical: paddingV ?? mq.width * .02),

            //
            decoration: BoxDecoration(
                color: whiteBtn ? Colors.white : pColor,
                border:
                    Border.all(color: whiteBtn ? pColor : Colors.transparent),
                borderRadius: BorderRadius.circular(22)),

            //
            child: Text(text,
                textAlign: TextAlign.center,

                //
                style: TextStyle(
                    color: whiteBtn ? pColor : Colors.white,
                    fontSize: fontSize,
                    letterSpacing: .3,
                    fontWeight: FontWeight.w600))));
  }
}
