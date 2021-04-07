import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getx_api_integration/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration/views/single_product.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                )),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (productController.isLoading == true)
              return Center(child: CircularProgressIndicator());
            return StaggeredGridView.countBuilder(
                itemCount: productController.productList.length,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1));
          }))
        ],
      ),
    );
  }
}
