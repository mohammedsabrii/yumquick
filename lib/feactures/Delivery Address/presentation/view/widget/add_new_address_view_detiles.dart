import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';

class AddNewAddressViewDetiles extends StatelessWidget {
  const AddNewAddressViewDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.041),
              SvgPicture.asset(
                AppAssets.kdeliveryHomeIcon,
                width: MediaQuery.sizeOf(context).width * 0.193,
                height: MediaQuery.sizeOf(context).height * 0.0784,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0627),
              const CustomTextField(
                lableText: 'New Address Name',
                textFieldTitle: 'Name',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0257),
              const CustomTextField(
                lableText: 'New Address',
                textFieldTitle: 'Address',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1277),
              CustomButton(
                color: AppColor.kMainColor,
                title: 'Add New Address',
                textStyle: AppStyles.styleLeagueSpartanMediem17(
                  context,
                ).copyWith(color: AppColor.kCultured),
                width: MediaQuery.sizeOf(context).width * 0.379,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
