import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomOffersItem extends StatelessWidget {
  const CustomOffersItem({
    super.key,
    required this.title,
    required this.offer,
    required this.image,
  });
  final String title, offer, image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).height * 0.152,
          decoration: const BoxDecoration(
            color: AppColor.kMainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanregular16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
              Text(
                offer,
                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanBold32(context),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).height * 0.152,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
