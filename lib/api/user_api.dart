import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_with_bloc/models/users.dart';

class UserApi {
  Future<List<User>> fetchUser() async {
    try {
      final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final List<dynamic> type = jsonDecode(response.body) as List<dynamic>;
      print(type
          .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
          .toList());
      return type
          .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }
}