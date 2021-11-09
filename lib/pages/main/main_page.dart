
import 'package:flutter/material.dart';
import 'package:project_with_bloc/resources/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.background,
      body: Center(
        child: Text('Main Page', style: TextStyle(color: CustomColors.labelColor, fontSize: 30),),
      ),
    );
  }
}
