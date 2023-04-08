import 'package:flutter/material.dart';

import '../../../utils/colors/colors.dart';
import '../../../utils/dimensions/dimensions.dart';
import '../../../widgets/widgets.dart';

class TimeLocationComponent extends StatelessWidget {
  const TimeLocationComponent({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: text,size: Dimensions.font26,),
      SizedBox(
        height: Dimensions.height10,
      ),
      Row(
        children: [
          Wrap(
            children: [
              ...List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      ))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "1200"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "comments"),
        ],
      ),
      SizedBox(
        height: Dimensions.height15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconText(
              icon: Icons.circle_sharp,
              text: "Normal ",
              iconColor: AppColors.iconColor1),
          IconText(
              icon: Icons.location_on,
              text: "1.7km ",
              iconColor: AppColors.iconColor1),
          IconText(
              icon: Icons.access_time_rounded,
              text: "32 min ",
              iconColor: AppColors.iconColor2),
        ],
      )
    ]);
  }
}
