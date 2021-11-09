part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class SendingDataState extends LoginState {}

class OpenMainPageState extends LoginState {}

class FormValidateSuccessState extends LoginState {}

class FormValidateErrorState extends LoginState {}
