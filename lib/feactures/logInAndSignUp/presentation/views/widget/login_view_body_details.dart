import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custom_textfild.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custon_signup_widget.dart';

class LoginViewBodyDetails extends StatelessWidget {
  const LoginViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.766,
      decoration: const BoxDecoration(
        color: AppColor.kCultured,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 35),
            child: Text(
              'Welcome',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
          const SizedBox(height: 52),
          Padding(
            padding: const EdgeInsets.only(left: 34),
            child: Text(
              'Email or Mobile Number',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 45,
              width: MediaQuery.sizeOf(context).width * 0.82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: const Color(0xFFF3E9B5),
              ),
              child: const CustomTextFaild(
                // lableText: 'Email or Mobile Number',
                suffixIcon: Icons.alternate_email,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(left: 34),
            child: Text(
              'Password',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 45,
              width: MediaQuery.sizeOf(context).width * 0.82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: const Color(0xFFF3E9B5),
              ),
              child: const CustomTextFaild(
                // lableText: 'Password',
                suffixIcon: Icons.remove_red_eye,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Text(
                'forget password',

                style: AppStyles.styleLeagueSpartanMediem14(
                  context,
                ).copyWith(color: const Color(0xFFE95322)),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.073),
          const CustomButton(
            color: AppColor.kMainColor,
            title: 'Log In',
            textColor: Colors.white,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
          Center(
            child: Text(
              'or sign up with',

              style: AppStyles.styleLeagueSpartanMediem14(
                context,
              ).copyWith(color: const Color(0xFF252525)),
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.kGoogleIcon),
              const SizedBox(width: 9),
              SvgPicture.asset(AppAssets.kFacebookIcon),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.0375),
          const CustomSignupWidget(),
        ],
      ),
    );
  }
}
