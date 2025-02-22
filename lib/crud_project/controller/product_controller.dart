import 'dart:convert';

import 'package:flutter_class/crud_project/utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List Products = [];
  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Products = data['data'];
    } else {
      throw Exception("data can't loaded");
    }
  }

  Future<void> createProducts(
      String name, String img, int qty, int unitPrice, int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.createProduct),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": unitPrice,
          "TotalPrice": totalPrice
        }));
    if (response.statusCode == 200) {
      fetchProducts();
    } else {
      throw Exception("data can't loaded");
    }
  }

  Future<void> deleteProducts(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));

    if (response.statusCode == 200) {
      //fetchProducts();
    } else {
      throw Exception("data can't loaded");
    }
  }
}
