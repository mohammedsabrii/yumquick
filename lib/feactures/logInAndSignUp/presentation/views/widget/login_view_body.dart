import 'package:flutter/material.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custom_login_and_signup_header.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/login_view_body_details.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
            CustomLoginAndSignUpHeader(
              title: 'Log In',
              space: MediaQuery.sizeOf(context).width * 0.31,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
            const LoginViewBodyDetails(),
          ],
        ),
      ],
    );
  }
}
