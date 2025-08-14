import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/profile_image.dart';

class MyProfileViewDetailes extends StatefulWidget {
  const MyProfileViewDetailes({super.key});

  @override
  State<MyProfileViewDetailes> createState() => _MyProfileViewDetailesState();
}

class _MyProfileViewDetailesState extends State<MyProfileViewDetailes> {
  String name = '';
  String email = '';
  String phone = '';

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;

    final response =
        await supabase
            .from('profiles')
            .select('username, phone, email')
            .eq('id', userId!)
            .single();

    setState(() {
      name = response['username'] ?? '';
      email = response['email'] ?? '';
      phone = response['phone'] ?? '';
      isLoading = false;
    });
  }

  void updateLocalData({String? newName, String? newEmail, String? newPhone}) {
    setState(() {
      if (newName != null) name = newName;
      if (newEmail != null) email = newEmail;
      if (newPhone != null) phone = newPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child:
            isLoading
                ? const Center(
                  child: CircularProgressIndicator(color: AppColor.kMainColor),
                )
                : SingleChildScrollView(
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
                        lableText: name.isNotEmpty ? name : 'No name set',
                        textFieldTitle: 'Full Name',
                        onChanged: (value) => updateLocalData(newName: value),
                      ),

                      CustomTextField(
                        lableText: email.isNotEmpty ? email : 'No email set',
                        textFieldTitle: 'Email',
                        onChanged: (value) => updateLocalData(newEmail: value),
                      ),

                      CustomTextField(
                        lableText: phone.isNotEmpty ? phone : 'No phone set',
                        textFieldTitle: 'Phone Number',
                        onChanged: (value) => updateLocalData(newPhone: value),
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.0445,
                      ),

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
                        onTap: () async {
                          final supabase = Supabase.instance.client;
                          final userId = supabase.auth.currentUser?.id;

                          await supabase.auth.updateUser(
                            UserAttributes(
                              email: email,
                            ), // email is your new email string
                          );
                          await supabase
                              .from('profiles')
                              .update({
                                'username': name,
                                'phone': phone,
                                'email': email,
                              })
                              .eq('id', userId!);
                          customShowSnackBar(context, title: 'Success');
                        },
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
}
