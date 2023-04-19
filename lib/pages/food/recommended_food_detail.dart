import 'package:flutter/material.dart';
import 'package:food_delivery/controller/product_controller.dart';
import 'package:food_delivery/core/constants/api_path.dart';
import 'package:food_delivery/core/constants/app_constants.dart';
import 'package:food_delivery/core/routes/route_helper.dart';
import 'package:food_delivery/utils/colors/colors.dart';
import 'package:food_delivery/utils/dimensions/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key, required this.pageId});
  final int pageId;
  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.getInitital()),
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20),
                        )),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Center(
                        child: BigText(
                      text: product.name!,
                      size: Dimensions.font26,
                    ))),
                preferredSize: Size.fromHeight(20)),
            pinned: true, //pins appbar
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300, //expands widget height upto 300
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                ApiPath.baseUrl + AppConstants.uploadUrl + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableText(text: product.description!),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$ ${product.price!}  X 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
            // height: Dimensions.bottomHeightBar,
            height: 120,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height30),
            decoration: BoxDecoration(
                color: AppColors.btnBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height20),
                  child: BigText(
                    text: "Add to Cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
