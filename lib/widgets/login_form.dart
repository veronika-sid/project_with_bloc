import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_with_bloc/managers/api_manager.dart';
import 'package:project_with_bloc/pages/login/bloc/login_bloc.dart';
import 'package:project_with_bloc/repository/user_repository.dart';
import 'package:project_with_bloc/resources/colors.dart';
import 'package:project_with_bloc/scalable_size/scalable_size.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late LoginBloc _bloc;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    _bloc = LoginBloc(
        userRepository: UserRepository(
      apiManager: ApiManager(),
    ));
    _bloc.add(LoginPageOpenEvent());
    _bloc.stream.listen((state) {
      if (state is FormValidateSuccessState) {
        Navigator.pushNamed(context, '/mainPage');
        _bloc.add(OpenMainPageEvent());
      }
      print(state);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: context.getScalableHeight(24),
                  width: context.getScalableWidth(293),
                  child: const Text(
                    'Email',
                    style:
                        TextStyle(color: CustomColors.labelColor, fontSize: 14),
                  ),
                ),
              ),
              Container(
                height: context.getScalableHeight(51),
                width: context.getScalableWidth(323),
                decoration: const BoxDecoration(
                  color: CustomColors.textFormFieldColor,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _email,
                  validator: (value) => state is FormValidateErrorState
                      ? 'Wrong login or password'
                      : null,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: context.getScalableHeight(15),
              ),
              Center(
                child: SizedBox(
                  height: context.getScalableHeight(24),
                  width: context.getScalableWidth(293),
                  child: const Text(
                    'Password',
                    style:
                        TextStyle(color: CustomColors.labelColor, fontSize: 14),
                  ),
                ),
              ),
              Container(
                height: context.getScalableHeight(51),
                width: context.getScalableWidth(323),
                decoration: const BoxDecoration(
                  color: CustomColors.textFormFieldColor,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _password,
                  validator: (value) => state is FormValidateErrorState
                      ? 'Wrong login or password'
                      : null,
                  style: const TextStyle(fontSize: 16),
                  textAlignVertical: TextAlignVertical.bottom,
                  obscureText: true,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      filled: true,
                      isDense: true),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                height: context.getScalableHeight(24),
                width: context.getScalableWidth(293),
                child: const Text(
                  'Remind my password',
                  style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: CustomColors.labelColor),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: context.getScalableHeight(30),
                ),
                height: context.getScalableHeight(53),
                width: context.getScalableWidth(323),
                decoration: BoxDecoration(
                  gradient: CustomColors.customGradient,
                  borderRadius:
                      BorderRadius.circular(context.getScalableHeight(90)),
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    _bloc.add(OnPressedButtonEvent(
                        email: _email.text, password: _password.text));
                  },
                  child: state is SendingDataState
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Log in',
                          style: TextStyle(fontSize: 22),
                        ),
                  backgroundColor: Colors.transparent,
                  heroTag: null,
                  elevation: 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
