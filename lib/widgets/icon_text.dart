import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconText(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.iconSize24,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
