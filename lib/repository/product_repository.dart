import 'package:project_with_bloc/managers/api_manager.dart';
import 'dart:convert';

import 'package:project_with_bloc/models/users.dart';

abstract class IProductRepository {
  Future<dynamic> getProducts();
  Future<int> getStatusCode();
}

class ProductRepository extends IProductRepository {
  ProductRepository({
    required this.apiManager,
  });

  final IApiManager apiManager;
  late final int statusCode;

  @override
  Future<dynamic> getProducts() async {
    final response = await apiManager.callApiRequest('https://jsonplaceholder.typicode.com/posts');
    if(response != null) {
      final List<dynamic> type = jsonDecode(response.body) as List<dynamic>;
      final users = type
          .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
      return users;
    } else {
      statusCode = await apiManager.getStatusCode();
      return null;
    }
  }

  @override
  Future<int> getStatusCode() async {
    return statusCode;
  }
}
