part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {}

class SendingDataState extends MainPageState {}

class OpenDataState extends MainPageState {
  final List<User> users;

  OpenDataState({required this.users});

  List<User> getUsers() {
    return users;
  }
}

class ErrorDataState extends MainPageState {
  final String statusCode;
  ErrorDataState({required this.statusCode});
  String getStatusCode() {
    return statusCode;
  }
}
