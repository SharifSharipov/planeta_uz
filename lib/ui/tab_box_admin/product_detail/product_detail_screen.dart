import 'package:flutter/material.dart';
import 'package:planeta_uz/data/model/product_model.dart';
// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key,required this.productModel});
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(productModel.productName),
            Text(productModel.description),
            Text(productModel.price.toString()),
            Text(productModel.count.toString()),
            Text(productModel.createdAt),
          ],
        ),
      ),
    );
  }
}