import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_button.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_dot_indicator_list.dart';

class OnPordingDetailsBody extends StatelessWidget {
  const OnPordingDetailsBody({
    super.key,
    required this.icon,
    required this.title,
    required this.supTitle,
    required this.cruntPageIndex,
    required this.onTap,
  });

  final String icon;
  final String title;
  final String supTitle;
  final int cruntPageIndex;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 23),
        SvgPicture.asset(icon),
        const SizedBox(height: 20),
        Text(
          title,
          style: AppStyles.syleInterExtraBold24(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
        const SizedBox(height: 19),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.69,
          child: Text(
            supTitle,
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanMediem14(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),
        const SizedBox(height: 31),
        CustomDotIdctorList(cruntPageIndex: cruntPageIndex),
        const SizedBox(height: 31),
        SizedBox(
          child:
              cruntPageIndex < 2
                  ? CustomButton(title: 'Next', onTap: onTap)
                  : const CustomButton(title: 'Get Started'),
        ),
      ],
    );
  }
}
