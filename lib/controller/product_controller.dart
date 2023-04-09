import 'package:food_delivery/data/repositories/product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepo popularProductRepo;
  ProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      //converting json to list of products
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //updates the changes like setState
    } else {}
  }

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  Future<void> getRecommendedProductList() async {
    Response response = await popularProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      //converting json to list of products
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //updates the changes like setState
    } else {}
  }
}
