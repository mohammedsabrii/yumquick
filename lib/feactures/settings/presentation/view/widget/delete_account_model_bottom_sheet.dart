import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';

class DeleteAccountModelBottomSheet extends StatelessWidget {
  const DeleteAccountModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.058),

            Text(
              'Are you sure you want to delete your account? \nIf you delete your account, you will not be able to recover your data. ',
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanBold20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomShowModalBottomSheetBottom(
                  text: 'Cancel',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
                CustomShowModalBottomSheetBottom(
                  onTap: () async {
                    // final supabase = Supabase.instance.client;
                    // final userId = supabase.from('deleteprofiles').insert('id');
                    // await supabase.from('profiles').delete().eq('id', userId);
                    // // await Supabase.instance.client
                    // //     .from('deleteProfiles')
                    // //     .insert('id');
                    // await supabase.auth.admin.deleteUser(userId.toString());
                    // await supabase.auth.signOut();
                  },
                  text: 'Delete any way',
                  color: AppColor.kMainColor,
                  textColor: AppColor.kPinkishOrange,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
