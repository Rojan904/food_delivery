import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText(
      {super.key,
      this.color = const Color(0xff332d2b),
      required this.text,
      this.size = 0,
      this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontFamily: "Roboto",
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
