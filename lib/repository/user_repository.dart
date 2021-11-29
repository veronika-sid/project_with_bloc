import 'package:project_with_bloc/managers/api_manager.dart';

abstract class IUserRepository {
  Future<bool> loginUser(String login, String pass);
}

class UserRepository extends IUserRepository {
  UserRepository({
    required this.apiManager,
  });

  final IApiManager apiManager;
  final String login = 'flutter.school@gmail.com';
  final String password = 'Bestee5';

  @override
  Future<bool> loginUser(String login, String pass) async {
    apiManager.loginRequest('$login = $pass');
    if(login==this.login && pass==password) {
      return true;
    } else {
      return false;
    }
    }

}
