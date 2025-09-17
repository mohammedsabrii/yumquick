import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function() onTap;
  final String title;
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
      onTap: onTap,
    );
  }
}
