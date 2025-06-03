import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.title,
    this.onTap,
  });
  final Color color;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 207,
          height: 45,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanMediem24(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
          ),
        ),
      ),
    );
  }
}
