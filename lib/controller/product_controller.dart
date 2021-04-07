import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_api_integration/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
