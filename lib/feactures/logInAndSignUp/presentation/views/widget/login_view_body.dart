import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
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
            Text('Log In', style: AppStyles.styleLeagueSpartanBold28(context)),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
            const LoginViewBodyDetails(),
          ],
        ),
      ],
    );
  }
}
