import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/contact_us_item.dart';

class ContactUsDetailes extends StatelessWidget {
  const ContactUsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0656),
            const ContactUsItem(
              height: 28,
              width: 40,
              icon: AppAssets.kCustomerServiceIcon,
              title: 'Customer Service',
            ),
            const ContactUsItem(icon: AppAssets.kWebsiteIcon, title: 'Website'),
            const ContactUsItem(
              icon: AppAssets.kWhatsappIcon,
              title: 'Whatsapp',
            ),
            const ContactUsItem(
              icon: AppAssets.kContactUsFacebookIcon,
              title: 'Facebook',
            ),
            const ContactUsItem(
              icon: AppAssets.kInstagramIcon,
              title: 'Instagram',
            ),
          ],
        ),
      ),
    );
  }
}
