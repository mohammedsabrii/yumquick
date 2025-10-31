import 'package:flutter/material.dart';

import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/splash/presentation/views/widget/spalash_view_body.dart';

class SpalshView extends StatelessWidget {
  const SpalshView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kMainColor,
        body: SplashViewBody(),
      ),
    );
  }
}
