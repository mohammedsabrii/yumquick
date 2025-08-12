import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/signup_view_body_dedails.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
        CustomPageHeader(
          title: 'New Account',
          space: MediaQuery.sizeOf(context).width * 0.22,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
        CustomContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.089,
            ),
            child: SignUpViewBodyDetails(),
          ),
        ),
      ],
    );
  }
}
