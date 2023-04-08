import 'package:food_delivery/data/api/api.dart';
import 'package:get/get.dart';
//while fetching data from internet we need to use getxService
class PopularProductRepo extends GetxService{
final ApiClient apiClient;
PopularProductRepo({required this.apiClient});
Future<Response> getPopularProductList()async{
return await apiClient.get("https://www.dbestech.com/api/product/list");
}
}