
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_with_bloc/resources/colors.dart';
import 'package:project_with_bloc/scalable_size/scalable_size.dart';

import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  final String nextRoute;

  const SplashPage({Key? key, required this.nextRoute}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc _bloc;

  @override
  void initState() {
    _bloc = SplashBloc();
    _bloc.add(OnSplashStarted());
    _bloc.stream.listen((state) {
      if(state is OpenLoginPageState) {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColors.background,
          body: Center(
            child: Container(
              height: context.getScalableHeight(262),
              width: context.getScalableWidth(262),
              decoration:
              const BoxDecoration(gradient: CustomColors.customGradient),
              child: Center(
                child: Container(
                  height: context.getScalableHeight(170),
                  width: context.getScalableWidth(170),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Logo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
