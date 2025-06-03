import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kMainColor,
        body: StartViewBody(),
      ),
    );
  }
}
