import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/cancel_order_details.dart';

class HaveActiveOrderItem extends StatelessWidget {
  const HaveActiveOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppAssets.korderTestImage),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.033),
            const Expanded(child: CancelOrderDetails()),
          ],
        ),
        const Divider(thickness: 1, color: AppColor.kMainColor),
      ],
    );
  }
}
