import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/widget/date_of_birth_text_fild.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/profile_image.dart';

class MyProfileViewDetailes extends StatelessWidget {
  const MyProfileViewDetailes({super.key});

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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0222),
              const ProfileImage(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0469),
              const CustomTextField(
                lableText: 'John Smith',
                textFieldTitle: 'Full Name',
              ),
              const DateOfBirthField(),
              const CustomTextField(
                lableText: 'Johnsmith@example.com',
                textFieldTitle: 'Email',
              ),
              const CustomTextField(
                lableText: '+123 567 89000',
                textFieldTitle: 'Phone Number',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0445),
              CustomButton(
                width: MediaQuery.sizeOf(context).width * 0.361,
                textStyle: AppStyles.styleLeagueSpartanMediem17(
                  context,
                ).copyWith(
                  color: AppColor.kCultured,
                  fontWeight: FontWeight.w600,
                ),
                color: AppColor.kMainColor,
                title: 'Update Profile',
                textColor: AppColor.kCultured,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),
            ],
          ),
        ),
      ),
    );
  }
}
