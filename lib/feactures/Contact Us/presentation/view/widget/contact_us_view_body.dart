import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/contact_us_detailes.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mq.height * 0.048),
        CustomPageHeader(title: 'Contact Us', space: mq.width * 0.221),
        Text(
          'how can we help you?',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanregular16(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
        const SizedBox(height: 5),
        const ContactUsDetailes(),
      ],
    );
  }
}
