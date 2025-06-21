import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custon_signup_widget.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/signup_with_facebook_and_gmail.dart';

class LoginViewBodyDetails extends StatelessWidget {
  const LoginViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.041),
              Text(
                'Welcome',
                style: AppStyles.styleLeagueSpartanBold24(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0609),

              const Center(
                child: CustomTextField(
                  textFieldTitle: 'Email or Mobile Number',
                  lableText: 'Email or Mobile Number',
                ),
              ),
              const Center(
                child: CustomTextField(
                  textFieldTitle: 'Password',
                  lableText: 'Password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'forget password',
                  style: AppStyles.styleLeagueSpartanMediem14(
                    context,
                  ).copyWith(color: const Color(0xFFE95322)),
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
              const SignUpWithFacebookAndGmail(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0375),
              CustomSignupWidget(
                title: 'Don’t have an account?',
                subTitle: '  Sign Up',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSignUpView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
