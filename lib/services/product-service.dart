import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../screens/models/products/products.dart';

class UserService {
  late Dio dio;

  UserService() {
    dio = Dio(BaseOptions(
        baseUrl: Platform.isIOS
            ? "https://fakestoreapi.com"
            : "https://fakestoreapi.com"));
  }

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get("/products");

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as List;

      return responseBody.map((e) => Product.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<bool> addProduct(Product product) async {
    final response = await dio.post(
      "/carts",
      data: product.toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }

  // https://fakestoreapi.com/products
  // https://fakestoreapi.com/products/1
  Future<Product> fetchProductByID(int id) async {
    final response = await dio.get("/products/${id}");
    debugPrint(response.statusCode.toString());

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as Map<String, dynamic>;
      debugPrint(responseBody.toString());
      debugPrint(response.statusCode.toString());
      return Product.fromJson(responseBody);
    }

    throw Exception();
  }
  
}
