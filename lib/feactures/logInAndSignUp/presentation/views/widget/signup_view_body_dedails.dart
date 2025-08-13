import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/signup_cubit/signup_cubit.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custon_signup_widget.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/signup_with_facebook_and_gmail.dart';

// ignore: must_be_immutable
class SignUpViewBodyDetails extends StatelessWidget {
  SignUpViewBodyDetails({super.key});
  bool isLoading = false;
  String? email, password, name, confirmPassword, mobileNumber;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          isLoading = true;
        } else if (state is SignupSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        } else if (state is SignupFailure) {
          customShowSnackBar(context, title: state.errorMassage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.041),
              Center(
                child: CustomTextField(
                  onChanged: (data) {
                    name = data;
                  },
                  textFieldTitle: 'Full name',
                  lableText: 'Enter Your Name',
                ),
              ),
              Center(
                child: CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  textFieldTitle: 'Email',
                  lableText: 'Your Email',
                ),
              ),
              Center(
                child: CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  textFieldTitle: 'Password',
                  lableText: 'Password',
                ),
              ),
              Center(
                child: CustomTextField(
                  onChanged: (data) {
                    confirmPassword = data;
                  },
                  textFieldTitle: 'Confirm Password',
                  lableText: 'Confirm Password',
                ),
              ),

              const SizedBox(height: 6),

              Center(
                child: CustomTextField(
                  onChanged: (data) {
                    mobileNumber = data;
                  },
                  textFieldTitle: 'Mobile Number',
                  lableText: 'Your Mobile Number',
                ),
              ),

              // const Center(child: DateOfBirthField()),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.042),
              CustomButton(
                onTap: () async {
                  BlocProvider.of<SignupCubit>(context).signInUser(
                    context,
                    name: name!,
                    email: email!,
                    password: password!,
                    confirmPassword: confirmPassword!,
                    phoneNumber: mobileNumber!,
                  );
                },
                color: AppColor.kMainColor,
                title: 'Sign Up',
                textColor: Colors.white,
                isLodaing: isLoading,
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.041),
            ],
          ),
        );
      },
    );
  }
}
