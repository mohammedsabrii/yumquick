import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';

class CustomLoginAndSignUpHeader extends StatelessWidget {
  const CustomLoginAndSignUpHeader({
    super.key,
    required this.title,
    required this.space,
  });
  final String title;
  final double space;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.089),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SvgPicture.asset(AppAssets.kBackIcon),
        ),
        SizedBox(width: space),
        Text(title, style: AppStyles.styleLeagueSpartanBold28(context)),
      ],
    );
  }
}
