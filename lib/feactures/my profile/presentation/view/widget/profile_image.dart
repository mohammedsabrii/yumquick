import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/colors.dart';

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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.148,
          width: MediaQuery.sizeOf(context).width * 0.323,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.kMainColor, width: 2),
          ),
          child: ClipOval(
            child:
                pickedImage != null
                    ? FutureBuilder<bool>(
                      future: File(pickedImage!.path).exists(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.kMainColor,
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data == true) {
                          return Image.file(
                            File(pickedImage!.path),
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Image.asset(
                                  AppAssets.kProfileImage,
                                  fit: BoxFit.cover,
                                ),
                          );
                        }
                        return Image.asset(
                          AppAssets.kProfileImage,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                    : (networkImage != null && networkImage!.isNotEmpty)
                    ? Image.network(
                      networkImage!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.kMainColor,
                          ),
                        );
                      },
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            AppAssets.kProfileImage,
                            fit: BoxFit.cover,
                          ),
                    )
                    : Image.asset(AppAssets.kProfileImage, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: -7,
          right: -7,
          child: GestureDetector(
            onTap: onImagePicked,
            child: SvgPicture.asset(AppAssets.kCamIcon),
          ),
        ),
      ],
    );
  }
}
