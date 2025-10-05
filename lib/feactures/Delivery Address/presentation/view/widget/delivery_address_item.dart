import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_text_field.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';

class DeliveryAddressItem extends StatelessWidget {
  const DeliveryAddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is EditProfileSuccess) {
          return Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),

              CustomTextField(
                onChanged: (newAdress) {
                  context.read<EditProfileCubit>().updateLocalData(
                    context,
                    newAddress: newAdress,
                  );
                },
                lableText: state.address,
                textFieldTitle: 'Edit your address',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0293),

              const Divider(thickness: 1, color: AppColor.kMainColor),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),

              CustomButton(
                onTap: () async {
                  await BlocProvider.of<EditProfileCubit>(context).editPrifile(
                    context,
                    name: state.name,
                    email: state.email,
                    phoneNumber: state.phone,
                    address: state.address,
                    country: state.cuntry,
                  );
                },
                color: AppColor.kPinkishOrange,
                title: 'Add New Address',
                textStyle: AppStyles.styleLeagueSpartanMediem17(
                  context,
                ).copyWith(color: AppColor.kMainColor),
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ],
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
