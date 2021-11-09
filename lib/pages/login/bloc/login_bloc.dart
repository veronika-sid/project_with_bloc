import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is OnPressedButtonEvent) {
        emit(SendingDataState());
        await Future.delayed(const Duration(seconds: 3));
        event.validator()
            ? emit(FormValidateSuccessState())
            : emit(FormValidateErrorState());
      }
      if(event is OpenMainPageEvent) {
        emit(OpenMainPageState());
      }
    });
  }
}
