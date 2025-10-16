import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer_header_details.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProfileInfoCubit, FetchProfileInfoState>(
      builder: (context, state) {
        if (state is FetchProfileInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kCultured),
          );
        } else if (state is FetchProfileInfoFaliure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is FetchProfileInfoSuccess) {
          return CustomDrawerHeaderDetails(profileEntity: state.profile);
        }
        return const Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
