import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_with_bloc/repository/user_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is OnPressedButtonEvent) {
        emit(SendingDataState());
        await Future.delayed(const Duration(seconds: 3));
        final login =
            await userRepository.loginUser(event.email, event.password);
        login
            ? emit(FormValidateSuccessState())
            : emit(FormValidateErrorState());
      }
      if (event is OpenMainPageEvent) {
        emit(OpenMainPageState());
      }
    });
  }
}
