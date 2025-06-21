import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';

class PasswordSettingsDetailes extends StatelessWidget {
  const PasswordSettingsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0762),
              CustomTextField(
                lableText: 'Current Password',
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

              CustomTextField(
                lableText: 'New Password',
                textFieldTitle: 'New Password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(AppAssets.kShowPasswordOff),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0304),

              CustomTextField(
                lableText: 'Confirm New Password',
                textFieldTitle: 'Confirm New Password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(AppAssets.kShowPasswordOff),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              CustomButton(
                color: AppColor.kMainColor,
                title: 'Change Password',
                textStyle: AppStyles.styleLeagueSpartanMediem17(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
