import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomOnPordingButton extends StatelessWidget {
  const CustomOnPordingButton({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: 133,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: ShapeDecoration(
          color: AppColor.kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,

          spacing: 10,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanMediem14(context).copyWith(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
