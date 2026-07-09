import 'package:dio/dio.dart';
import 'package:new_fiap_rest/app/core/client/api_client.dart';
import 'package:new_fiap_rest/app/core/network/response_types/response.dart' as response;
import 'package:new_fiap_rest/app/features/home/model/product_model.dart';
import 'package:new_fiap_rest/app/features/home/services/products/products_service.dart';

class ProductsServiceRemote implements ProductsService{

  @override
  Future<({List<ProductModel> products, response.Response result})> getProducts() async {
    final responseResult = await ApiClient.client.get('/api/v1/products');

    final data = responseResult.data as List;
    final List<ProductModel> productsList = data.map((e) => ProductModel.fromJson(e)).toList();

    return (products: productsList, result: const response.Success());
  }

  @override
  Future<({ProductModel? product, response.Response result})> createProduct(ProductModel product) async {
    await ApiClient.client.post('/api/v1/products', data: product.toJson());
    return (product: product, result: response.Success());
  }

  @override
  Future<({response.Response result, bool success})> deleteProduct(int id) async {
    await ApiClient.client.delete('/api/v1/products/$id');
    return (result: response.Success(),success: true);
  }

  @override
  Future<({ProductModel? product, response.Response result})> getProduct(int id) async {
    final res = await ApiClient.client.get('/api/v1/products/$id');
    ProductModel product = ProductModel.fromJson(res.data);
    return (product: product, result: response.Success());
  }

  @override
  Future<({ProductModel? product, response.Response result})> updateProduct(int id, ProductModel product) async {
    await ApiClient.client.put('/api/v1/products/$id',data: product.toJson());
    return (product: product, result: response.Success());
  }

}