import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/settings/presentation/manger/cubits/change_password_cubit/change_password_cubit.dart';

class PasswordSettingsDetailes extends StatelessWidget {
  PasswordSettingsDetailes({super.key});

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
        } else if (state is ChangePasswordSuccess) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return CustomContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.089,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0762),

                  // Current Password
                  CustomTextField(
                    controller: currentPasswordController,
                    hintText: 'Current Password',
                    textFieldTitle: 'Current Password',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppAssets.kShowPasswordOff),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'forgot password?',
                      style: AppStyles.styleLeagueSpartanMediem14(
                        context,
                      ).copyWith(color: AppColor.kMainColor, fontSize: 15),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0222),

                  // New Password
                  CustomTextField(
                    controller: newPasswordController,
                    hintText: 'New Password',
                    textFieldTitle: 'New Password',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppAssets.kShowPasswordOff),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0304),

                  // Confirm Password
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm New Password',
                    textFieldTitle: 'Confirm New Password',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppAssets.kShowPasswordOff),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),

                  // Button
                  CustomButton(
                    onTap: () {
                      BlocProvider.of<ChangePasswordCubit>(
                        context,
                      ).changePassword(
                        context,
                        currentPassword: currentPasswordController.text.trim(),
                        newPassword: newPasswordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim(),
                      );
                    },
                    color: AppColor.kMainColor,
                    title:
                        state is ChangePasswordLoading
                            ? 'Loading...'
                            : 'Change Password',
                    textStyle: AppStyles.styleLeagueSpartanMediem17(
                      context,
                    ).copyWith(color: AppColor.kCultured),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
