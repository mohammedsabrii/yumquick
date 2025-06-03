import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        body: LoginViewBody(),
      ),
    );
  }
}
