import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          AppAssets.kTestProfileImage,
          height: MediaQuery.sizeOf(context).height * 0.148,
          width: MediaQuery.sizeOf(context).width * 0.323,
        ),
        Positioned(
          bottom: -7,
          right: -7,

          child: SvgPicture.asset(AppAssets.kCamIcon, clipBehavior: Clip.none),
        ),
      ],
    );
  }
}
