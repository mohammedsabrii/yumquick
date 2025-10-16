import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/category_model.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width * 0.0483,
      ),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kMenuView);
        },
        child: Column(
          children: [
            SvgPicture.asset(model.icon),
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanregular12(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        ),
      ),
    );
  }
}
