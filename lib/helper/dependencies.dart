import 'package:food_delivery/controller/product_controller.dart';
import 'package:food_delivery/core/constants/api_path.dart';
import 'package:food_delivery/data/api/api.dart';
import 'package:food_delivery/data/repositories/product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: ApiPath.baseUrl));

  //repos
  //we have already initialized apiClient so the repo automatically finds the dependency class
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => ProductController(popularProductRepo: Get.find()));
}
