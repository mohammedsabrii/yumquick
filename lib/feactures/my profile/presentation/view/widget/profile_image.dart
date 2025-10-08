import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.onImagePicked,
    this.pickedImage,
    this.networkImage,
  });

  final XFile? pickedImage;
  final String? networkImage;
  final VoidCallback? onImagePicked;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (pickedImage != null) {
      imageWidget = Image.file(
        File(pickedImage!.path),
        height: MediaQuery.sizeOf(context).height * 0.148,
        width: MediaQuery.sizeOf(context).width * 0.323,
        fit: BoxFit.cover,
      );
    } else if (networkImage != null && networkImage!.isNotEmpty) {
      imageWidget = Image.network(
        networkImage!,
        height: MediaQuery.sizeOf(context).height * 0.148,
        width: MediaQuery.sizeOf(context).width * 0.323,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppAssets.kNullProfileImage,
            height: MediaQuery.sizeOf(context).height * 0.148,
            width: MediaQuery.sizeOf(context).width * 0.323,
            fit: BoxFit.fill,
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        AppAssets.kNullProfileImage,
        height: MediaQuery.sizeOf(context).height * 0.148,
        width: MediaQuery.sizeOf(context).width * 0.323,
        fit: BoxFit.cover,
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(100), child: imageWidget),
        Positioned(
          bottom: -3,
          right: 3,
          child: GestureDetector(
            onTap: onImagePicked,
            child: SvgPicture.asset(AppAssets.kCamIcon),
          ),
        ),
      ],
    );
  }
}
