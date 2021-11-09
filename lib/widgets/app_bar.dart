
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_with_bloc/resources/colors.dart';
import 'package:project_with_bloc/scalable_size/scalable_size.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.appBarColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      flexibleSpace: Center(
        child: Container(
          height: context.getScalableHeight(110),
          width: context.getScalableWidth(110),
          decoration:
              const BoxDecoration(gradient: CustomColors.customGradient),
          margin: EdgeInsets.only(
            top: context.getScalableHeight(24.5),
            right: context.getScalableWidth(131.5),
            left: context.getScalableWidth(135.5),
            bottom: context.getScalableHeight(25.0),
          ),
          child: Container(
            height: context.getScalableHeight(74),
            width: context.getScalableWidth(74),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/Logo.png'),
            )),
          ),
        ),
      ),
    );
  }
}
