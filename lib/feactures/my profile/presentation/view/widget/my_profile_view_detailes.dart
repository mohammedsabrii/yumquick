import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/profile_image.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/update_profile_button.dart';

class MyProfileViewDetailes extends StatefulWidget {
  const MyProfileViewDetailes({super.key});

  @override
  State<MyProfileViewDetailes> createState() => _MyProfileViewDetailesState();
}

class _MyProfileViewDetailesState extends State<MyProfileViewDetailes> {
  XFile? pickedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = pickedFile;
      });

      BlocProvider.of<EditProfileCubit>(
        context,
      ).updateLocalData(context, newProfilePicture: pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            if (state is EditProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.kMainColor),
              );
            } else if (state is EditProfileFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is EditProfileSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0222,
                    ),
                    ProfileImage(
                      onImagePicked: pickImage,
                      pickedImage: pickedImage,
                      networkImage:
                          state.profilePicture.isNotEmpty
                              ? state.profilePicture
                              : null,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0469,
                    ),
                    CustomTextField(
                      hintText:
                          state.name.isNotEmpty ? state.name : 'No name set',
                      textFieldTitle: 'Full Name',
                      onChanged: (value) {
                        BlocProvider.of<EditProfileCubit>(
                          context,
                        ).updateLocalData(context, newName: value);
                      },
                    ),
                    CustomTextField(
                      hintText:
                          state.email.isNotEmpty ? state.email : 'No email set',
                      textFieldTitle: 'Email',
                      onChanged: (value) {
                        BlocProvider.of<EditProfileCubit>(
                          context,
                        ).updateLocalData(context, newEmail: value);
                      },
                    ),
                    CustomTextField(
                      hintText:
                          state.phone.isNotEmpty ? state.phone : 'No phone set',
                      textFieldTitle: 'Phone Number',
                      onChanged: (value) {
                        BlocProvider.of<EditProfileCubit>(
                          context,
                        ).updateLocalData(context, newPhone: value);
                      },
                    ),
                    CustomTextField(
                      hintText:
                          state.address.isNotEmpty
                              ? state.address
                              : 'No address set',
                      textFieldTitle: 'Address',
                      onChanged: (value) {
                        BlocProvider.of<EditProfileCubit>(
                          context,
                        ).updateLocalData(context, newAddress: value);
                      },
                    ),
                    CustomTextField(
                      hintText:
                          state.cuntry.isNotEmpty
                              ? state.cuntry
                              : 'No country set',
                      textFieldTitle: 'Country',
                      onChanged: (value) {
                        BlocProvider.of<EditProfileCubit>(
                          context,
                        ).updateLocalData(context, newCountry: value);
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
                      onTap: () async {
                        await BlocProvider.of<EditProfileCubit>(
                          context,
                        ).editPrifile(
                          context,
                          name: state.name,
                          email: state.email,
                          phoneNumber: state.phone,
                          address: state.address,
                          country: state.cuntry,
                          image: pickedImage,
                        );
                        setState(() {
                          pickedImage = null;
                        });
                        GoRouter.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0293,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          },
        ),
      ),
    );
  }
}
