import 'package:dio/dio.dart';

class ProductService {
  Future<List> getProduct({
    required int page,
  }) async {
    var response = await Dio().get(
      "https://dummyjson.com/products?skip=$page&limit=10",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["products"];
  }
}
