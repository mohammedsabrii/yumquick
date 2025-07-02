import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class MoreBestSelleritemNameAndSupTitle extends StatelessWidget {
  const MoreBestSelleritemNameAndSupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Gourmet Grilled Skewers',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleLeagueSpartanMediem16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur...',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleLeagueSpartanregular12(
                    context,
                  ).copyWith(
                    color: AppColor.kDarkRed,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
