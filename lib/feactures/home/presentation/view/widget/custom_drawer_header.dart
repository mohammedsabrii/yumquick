import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_assets.dart';

import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

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
          return Row(
            children: [
              state.profile.profileImage!.isNotEmpty
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      state.profile.profileImage ?? AppAssets.kNullProfileImage,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(100),

                    child: Image.asset(
                      AppAssets.kNullProfileImage,
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.0585),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.profile.name ?? 'No Nmae Set',
                      style: AppStyles.styleLeagueSpartanBold20(
                        context,
                      ).copyWith(color: AppColor.kCultured, fontSize: 18),
                    ),
                    Text(
                      state.profile.email ?? 'No Email Set',
                      maxLines: 2,
                      style: AppStyles.styleLeagueSpartanMediem14(
                        context,
                      ).copyWith(color: AppColor.kCultured),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
