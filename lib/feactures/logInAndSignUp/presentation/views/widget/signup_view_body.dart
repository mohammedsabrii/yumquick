import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custon_signup_widget.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/date_of_birth_text_fild.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/signup_with_facebook_and_gmail.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
            CustomPageHeader(
              title: 'New Account',
              space: MediaQuery.sizeOf(context).width * 0.22,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.766,
              decoration: const BoxDecoration(
                color: AppColor.kCultured,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.089,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CustomTextField(
                        textFieldTitle: 'Full name',
                        lableText: 'Enter Your Name',
                      ),
                    ),

                    const Center(
                      child: CustomTextField(
                        textFieldTitle: 'Password',
                        lableText: 'Password',
                      ),
                    ),

                    const Center(
                      child: CustomTextField(
                        textFieldTitle: 'Email',
                        lableText: 'Your Email',
                      ),
                    ),
                    const SizedBox(height: 6),

                    const Center(
                      child: CustomTextField(
                        textFieldTitle: 'Mobile Number',
                        lableText: 'Your Mobile Number',
                      ),
                    ),

                    const Center(child: DateOfBirthField()),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.042),
                    const CustomButton(
                      color: AppColor.kMainColor,
                      title: 'Sign Up',
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 9),
                    Center(
                      child: Text(
                        'or sign up with',
                        style: AppStyles.styleLeagueSpartanMediem14(
                          context,
                        ).copyWith(color: const Color(0xFF252525)),
                      ),
                    ),
                    const SizedBox(height: 9),
                    const SignUpWithFacebookAndGmail(),
                    const SizedBox(height: 9),

                    CustomSignupWidget(
                      title: 'Already have an account?',
                      subTitle: '  Log In',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kLogInView);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
