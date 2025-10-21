import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';

class DeliveryAddressItem extends StatelessWidget {
  const DeliveryAddressItem({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.cuntry,
  });
  final String name, email, phone, address, cuntry;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      children: [
        const Divider(thickness: 1, color: AppColor.kMainColor),
        SizedBox(height: mq.height * 0.0293),
        CustomTextField(
          onChanged: (newAdress) {
            context.read<EditProfileCubit>().updateLocalData(
              context,
              newAddress: newAdress,
            );
          },
          lableText: address,
          textFieldTitle: 'Edit your address',
        ),
        SizedBox(height: mq.height * 0.0293),

        const Divider(thickness: 1, color: AppColor.kMainColor),
        SizedBox(height: mq.height * 0.05),

        CustomButton(
          onTap: () async {
            await BlocProvider.of<EditProfileCubit>(context).editPrifile(
              context,
              name: name,
              email: email,
              phoneNumber: phone,
              address: address,
              country: cuntry,
            );
          },
          color: AppColor.kPinkishOrange,
          title: 'Add New Address',
          textStyle: AppStyles.styleLeagueSpartanMediem17(
            context,
          ).copyWith(color: AppColor.kMainColor),
          width: mq.width * 0.47,
        ),
      ],
    );
  }
}
