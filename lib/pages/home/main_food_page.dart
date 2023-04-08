import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/food_page_body.dart';
import 'package:food_delivery/utils/colors/colors.dart';
import 'package:food_delivery/utils/dimensions/dimensions.dart';
import 'package:food_delivery/widgets/widgets.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Nepal",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Kathmandu",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_circle)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: FoodPageBody()),
        ],
      ),
    );
  }
}
