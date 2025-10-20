import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/delivery_address_item.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';

class DeliveryAddressBlocBuilder extends StatelessWidget {
  const DeliveryAddressBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is EditProfileSuccess) {
          return DeliveryAddressItem(
            name: state.name,
            email: state.email,
            phone: state.phone,
            address: state.address,
            cuntry: state.cuntry,
          );
        } else if (state is EditProfileFailure) {
          return Text(
            state.errorMessage,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: Colors.red),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        }
      },
    );
  }
}
