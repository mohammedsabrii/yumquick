import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.33),
        SvgPicture.asset(AppAssets.kLogo2),
        const SizedBox(height: 45),
        CustomButton(
          color: AppColor.kYellowBase,
          title: 'Log In',
          onTap: () {
            GoRouter.of(context).go(AppRouter.kLogInView);
          },
        ),
        const SizedBox(height: 4),
        const CustomButton(color: AppColor.kYellow, title: 'Sign Up'),
      ],
    );
  }
}
