import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kYellowBase,
        body: SignupViewBody(),
      ),
    );
  }
}

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
            Text(
              'New Account',
              style: AppStyles.styleLeagueSpartanBold28(context),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
          ],
        ),
      ],
    );
  }
}
