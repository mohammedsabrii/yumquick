import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/more_best_seller_details.dart';

class MoreBestSellerViewBody extends StatelessWidget {
  const MoreBestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        CustomPageHeader(
          title: 'Best Seller',
          space: MediaQuery.sizeOf(context).width * 0.226,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        const MoreBestSellerDetails(),
      ],
    );
  }
}
