import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/login_cubit/auth_cubit.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/custon_signup_widget.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/signup_with_gmail.dart';

// ignore: must_be_immutable
class LoginViewBodyDetails extends StatelessWidget {
  LoginViewBodyDetails({super.key});

  bool isLoading = false;
  String? email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        } else if (state is AuthFailure) {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.089,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0609,
                    ),

                    Center(
                      child: CustomTextField(
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        onChanged: (data) {
                          email = data;
                        },
                        textFieldTitle: 'Email or Mobile Number',
                        hintText: 'Email or Mobile Number',
                      ),
                    ),

                    Center(
                      child: CustomTextField(
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        onChanged: (data) {
                          password = data;
                        },
                        textFieldTitle: 'Password',
                        hintText: 'Password',
                        suffixIcon: const Icon(
                          Icons.vpn_key_rounded,
                          color: AppColor.kMainColor,
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.073),

                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).logInUser(
                            context,
                            email: email!,
                            password: password!,
                          );
                        }
                      },
                      color: AppColor.kMainColor,
                      title: 'Log In',
                      textColor: Colors.white,
                      isLodaing: isLoading,
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
                    SignUpWithGmail(isLoding: isLoading),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0375,
                    ),
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
          ),
        );
      },
    );
  }
}
