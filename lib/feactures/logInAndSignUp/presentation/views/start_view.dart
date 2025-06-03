import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kMainColor,
      body: StartViewBody(),
    );
  }
}

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.33),
        SvgPicture.asset(AppAssets.kLogo2),
        const SizedBox(height: 45),
        const CustomButton(color: AppColor.kYellowBase, title: 'Log In'),
        const SizedBox(height: 4),
        const CustomButton(color: AppColor.kYellow, title: 'Sign Up'),
      ],
    );
  }
}
