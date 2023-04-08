import 'package:get/get.dart';

//we are controlling api connection with getx package
class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    //baseurl and timeout is from getx package
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      //get method is from getx and getx uses http client 
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}
