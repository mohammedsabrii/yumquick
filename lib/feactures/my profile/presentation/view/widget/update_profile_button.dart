import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    super.key,
    required this.email,
    required this.name,
    required this.phone,
    required this.title,
  });

  final String email, title;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: MediaQuery.sizeOf(context).width * 0.361,
      textStyle: AppStyles.styleLeagueSpartanMediem17(
        context,
      ).copyWith(color: AppColor.kCultured, fontWeight: FontWeight.w600),
      color: AppColor.kMainColor,
      title: title,
      textColor: AppColor.kCultured,
      onTap: () async {
        final supabase = Supabase.instance.client;
        final userId = supabase.auth.currentUser?.id;

        await supabase.auth.updateUser(UserAttributes(email: email));
        await supabase
            .from('profiles')
            .update({'username': name, 'phone': phone, 'email': email})
            .eq('id', userId!);
        GoRouter.of(context).pop();
        customShowSnackBar(context, title: 'Success');
      },
    );
  }
}
