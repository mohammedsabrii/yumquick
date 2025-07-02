import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/rate_widget.dart';

class MoreBestSellerItem extends StatelessWidget {
  const MoreBestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      width: MediaQuery.sizeOf(context).width * 0.402,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.402,
              height: MediaQuery.sizeOf(context).height * 0.167,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppAssets.kTestImage),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0152),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Stack(
                children: [
                  Row(
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
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: RateWidget(
                        color: AppColor.kMainColor,
                        textColor: AppColor.kCultured,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
