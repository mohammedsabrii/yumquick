import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/login_view_body_details.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0515),
        CustomPageHeader(
          title: 'Log In',
          space: MediaQuery.sizeOf(context).width * 0.31,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
        const LoginViewBodyDetails(),
      ],
    );
  }
}
