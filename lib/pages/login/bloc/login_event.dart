part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnPressedButtonEvent extends LoginEvent {
  final String email;
  final String password;

  OnPressedButtonEvent({required this.email, required this.password});

  bool validator() {
    if (email == 'flutter.school@gmail.com' && password == 'Bestee5') {
      return true;
    } else {
      return false;
    }
  }
}

class OpenMainPageEvent extends LoginEvent {}
