import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class SignUpWithFacebookAndGmail extends StatelessWidget {
  const SignUpWithFacebookAndGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.kGoogleIcon),
        const SizedBox(width: 9),
        SvgPicture.asset(AppAssets.kFacebookIcon),
      ],
    );
  }
}
