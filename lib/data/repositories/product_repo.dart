import 'package:food_delivery/core/constants/api_path.dart';
import 'package:food_delivery/data/api/api.dart';
import 'package:get/get.dart';

//while fetching data from internet we need to use getxService
class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.get(ApiPath.popularProductUrl);
  }
  Future<Response> getRecommendedProductList() async {
    return await apiClient.get(ApiPath.recommendedProductUrl);
  }
}
