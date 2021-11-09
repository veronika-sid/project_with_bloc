import 'package:flutter/material.dart';
import 'package:project_with_bloc/resources/colors.dart';
import 'package:project_with_bloc/scalable_size/scalable_size.dart';
import 'package:project_with_bloc/widgets/app_bar.dart';
import 'package:project_with_bloc/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.getScalableHeight(159.5)),
        child: const CustomAppBar(),
      ),
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: context.getScalableHeight(50),
            color: CustomColors.appBarColor,
            child: Container(
              child: TabBar(
                indicatorColor: CustomColors.indicatorColor,
                controller: _controller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Existing user',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'New user',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: CustomColors.tabBarColor,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(context.getScalableHeight(10))),
              ),
            ),
          ),
          SizedBox(
            height: context.getScalableHeight(602),
            width: context.getScalableWidth(375),
            child: TabBarView(controller: _controller, children: [
              Column(children: [
                Container(
                    padding: EdgeInsets.only(
                      top: context.getScalableHeight(14),
                      right: context.getScalableWidth(26),
                      left: context.getScalableWidth(26),
                    ),
                    child: const LogInForm()),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: context.getScalableHeight(18),
                  width: context.getScalableWidth(343),
                  child: const Text(
                    'Log in with social networks',
                    style: TextStyle(color: CustomColors.textColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: context.getScalableWidth(24),
                    left: context.getScalableWidth(87),
                    right: context.getScalableWidth(88),
                  ),
                  height: context.getScalableHeight(40),
                  width: context.getScalableWidth(200),
                  decoration: const BoxDecoration(
                    color: CustomColors.facebook,
                  ),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: context.getScalableWidth(14),
                          right: context.getScalableWidth(10)),
                      child: Image(
                        image: const AssetImage('assets/images/Facebook.png'),
                        width: context.getScalableWidth(18),
                        height: context.getScalableHeight(18),
                      ),
                    ),
                    const Text(
                      'Sign in with Facebook',
                      style: TextStyle(color: CustomColors.textColor),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: context.getScalableWidth(18),
                    left: context.getScalableWidth(87),
                    right: context.getScalableWidth(88),
                  ),
                  height: context.getScalableHeight(40),
                  width: context.getScalableWidth(200),
                  decoration: const BoxDecoration(
                    color: CustomColors.google,
                  ),
                  child: Row(children: [
                    Container(
                      height: context.getScalableHeight(38),
                      width: context.getScalableWidth(38),
                      color: CustomColors.googleBackground,
                      margin:
                          EdgeInsets.only(right: context.getScalableWidth(18)),
                      child: Image(
                        image: const AssetImage('assets/images/Google.png'),
                        width: context.getScalableWidth(18),
                        height: context.getScalableHeight(18),
                      ),
                    ),
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(color: CustomColors.textColor),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: context.getScalableWidth(18),
                    left: context.getScalableWidth(87),
                    right: context.getScalableWidth(88),
                  ),
                  height: context.getScalableHeight(40),
                  width: context.getScalableWidth(200),
                  decoration: const BoxDecoration(
                    color: CustomColors.apple,
                  ),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: context.getScalableWidth(26),
                          right: context.getScalableWidth(12)),
                      child: Image(
                        image: const AssetImage('assets/images/Apple.png'),
                        width: context.getScalableWidth(18),
                        height: context.getScalableHeight(18),
                      ),
                    ),
                    const Text(
                      'Sign in with Apple',
                      style: TextStyle(color: CustomColors.textColor),
                    ),
                  ]),
                )
              ]),
              const Center(child: Text('Registration', style: TextStyle(color: CustomColors.labelColor, fontSize: 24),)),
            ]),
          ),
        ]),
      ),
    );
  }
}
