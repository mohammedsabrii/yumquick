import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

void customShowSnackBar(BuildContext context, {required String title}) {
  var snackBar = SnackBar(
    elevation: 0,
    content: Text(
      title,
      style: AppStyles.styleLeagueSpartanBold15(
        context,
      ).copyWith(color: AppColor.kDarkRed),
    ),
    backgroundColor: AppColor.kPinkishOrange.withValues(alpha: .8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.all(16),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
