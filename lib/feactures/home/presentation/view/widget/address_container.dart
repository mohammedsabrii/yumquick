import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kDeliveryAddress),
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          color: AppColor.kYellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: BlocBuilder<FetchProfileInfoCubit, FetchProfileInfoState>(
              builder: (context, state) {
                return state is FetchProfileInfoSuccess
                    ? Text(
                      state.profile.address ?? '',
                      style: AppStyles.styleLeagueSpartanMediem16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    )
                    : Text(
                      'Add your address',
                      style: AppStyles.styleLeagueSpartanMediem16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
