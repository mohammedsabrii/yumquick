import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/contact_us_item.dart';

class ContactUsDetailes extends StatelessWidget {
  const ContactUsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.089),
        child: Column(
          children: [
            SizedBox(height: mq.height * 0.0656),
            const ContactUsItem(
              url: kCustomerServiceUrl,
              height: 28,
              width: 40,
              icon: AppAssets.kCustomerServiceIcon,
              title: 'Customer Service',
            ),
            const ContactUsItem(
              url: kWebSiteUrl,
              icon: AppAssets.kWebsiteIcon,
              title: 'Website',
            ),
            const ContactUsItem(
              url: kWhatsAppUrl,
              icon: AppAssets.kWhatsappIcon,
              title: 'Whatsapp',
            ),
            const ContactUsItem(
              url: kFaceBookUrl,
              icon: AppAssets.kContactUsFacebookIcon,
              title: 'Facebook',
            ),
            const ContactUsItem(
              url: kInstagramUrl,
              icon: AppAssets.kInstagramIcon,
              title: 'Instagram',
            ),
          ],
        ),
      ),
    );
  }
}
