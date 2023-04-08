import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/data/api/api.dart';
import 'package:food_delivery/data/repositories/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));

  //repos
  //we have already initialized apiClient so the repo automatically finds the dependency class
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
