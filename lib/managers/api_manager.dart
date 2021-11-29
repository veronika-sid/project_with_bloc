import 'package:http/http.dart' as http;

abstract class IApiManager {
  Future<dynamic> loginRequest(String params);

  Future<dynamic> callApiRequest(String url);

  Future<int> getStatusCode();
}

class ApiManager extends IApiManager {
  late final int statusCode;

  @override
  Future<dynamic> loginRequest(String params) async {
    print('Login with param $params');
  }

  @override
  Future<dynamic> callApiRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    if(response.statusCode == 200) {
      return response;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      statusCode = response.statusCode;
      return null;
    }
  }

  @override
  Future<int> getStatusCode() async {
    return statusCode;
  }


}