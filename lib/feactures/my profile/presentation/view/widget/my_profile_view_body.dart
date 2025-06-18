import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/widget/my_profile_view_detailes.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0492),
        CustomPageHeader(
          title: 'My profile',
          space: MediaQuery.sizeOf(context).width * 0.231,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const MyProfileViewDetailes(),
      ],
    );
  }
}
