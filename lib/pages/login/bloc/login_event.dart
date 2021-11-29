part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginPageOpenEvent extends LoginEvent {

}

class OnPressedButtonEvent extends LoginEvent {
  final String email;
  final String password;

  OnPressedButtonEvent({required this.email, required this.password});
}

class OpenMainPageEvent extends LoginEvent {}
