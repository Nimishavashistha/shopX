import 'package:getx_api_integration/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
