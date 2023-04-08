import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/time_location.dart';
import 'package:food_delivery/utils/colors/colors.dart';
import 'package:food_delivery/utils/dimensions/dimensions.dart';
import 'package:food_delivery/widgets/widgets.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageVal = 0.0;
  var scaleFactor = 0.8; //set to 0.8 bcoz we want 80 percent in current index
  double height = Dimensions.pageViewContainer;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currPageVal = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (ctx, index) {
                  return buildPageItem(index);
                }),
          ),
          DotsIndicator(
            dotsCount: 5,
            position: currPageVal,
            decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (ctx, idx) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/food.jpg"))),
                      ),
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritious fruit meal in Nepal"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(text: "With Nepali Characteristics"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget buildPageItem(int index) {
    //it has 3 cordinates x,y,z
    Matrix4 matrix4 = Matrix4.identity();
    //it is for current page
    if (index == currPageVal.floor()) {
      var currScale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTransform = height * (1 - currScale) / 2;

      //once we scale, we shift the position of the widgets
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTransform, 0);
    }
    //it is for next page
    else if (index == currPageVal.floor() + 1) {
      var currScale =
          scaleFactor + (currPageVal - index + 1) * (1 - scaleFactor);
      var currTransform = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTransform, 0);
    } else if (index == currPageVal.floor() - 1) {
      var currScale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTransform = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTransform, 0);
    } else {
      var currScale =
          0.8; //it is for third or rest of the widgets to automatically size to 0.8
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix4, //passing matrix4
      child: Stack(
        children: [
          Container(
            height: height,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.amberAccent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: 15,
                    bottom: Dimensions.height15),
                child: 
                TimeLocationComponent(text: "Nepali Food"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

