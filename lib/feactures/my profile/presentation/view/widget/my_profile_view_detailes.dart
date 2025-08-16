import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/profile_image.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/update_profile_button.dart';

class MyProfileViewDetailes extends StatelessWidget {
  const MyProfileViewDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EditProfileCubit>(context).editPrifile(context);
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is EditProfileFailure) {
          return Center(
            child: Text(
              state.errorMassage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is EditProfileSuccess) {
          return CustomContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.089,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0222,
                    ),
                    const ProfileImage(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0469,
                    ),
                    CustomTextField(
                      lableText:
                          state.name.isNotEmpty ? state.name : 'No name set',
                      textFieldTitle: 'Full Name',
                      onChanged: (value) {
                        context.read<EditProfileCubit>().updateLocalData(
                          context,
                          newName: value,
                        );
                      },
                    ),
                    CustomTextField(
                      lableText:
                          state.email.isNotEmpty ? state.email : 'No email set',
                      textFieldTitle: 'Email',
                      onChanged: (value) {
                        context.read<EditProfileCubit>().updateLocalData(
                          context,
                          newEmail: value,
                        );
                      },
                    ),
                    CustomTextField(
                      lableText:
                          state.phone.isNotEmpty ? state.phone : 'No phone set',
                      textFieldTitle: 'Phone Number',
                      onChanged: (value) {
                        context.read<EditProfileCubit>().updateLocalData(
                          context,
                          newPhone: value,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0445,
                    ),
                    UpdateProfileButton(
                      title:
                          state is EditProfileLoading
                              ? 'Loading...'
                              : 'Update Profile',
                      email: state.email,
                      name: state.name,
                      phone: state.phone,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0293,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Text(
          'OOPS, There was an error please try again ',
          style: AppStyles.styleLeagueSpartanBold28(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        );
      },
    );
  }
}
