import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/manger/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

class LogoutModelBottomSheet extends StatelessWidget {
  const LogoutModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.089),
      child: SizedBox(
        width: double.infinity,
        height: mediaQuery.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: mediaQuery.height * 0.058),
            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: AppStyles.syleInterExtraBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: mediaQuery.height * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomShowModalBottomSheetBottom(
                  title: 'Cancel',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
                CustomShowModalBottomSheetBottom(
                  onTap: () async {
                    final profileBox = Hive.box<ProfileEntity>(kProfileBox);
                    final favoritesBox = Hive.box<String>(kFavoritesBox);
                    await profileBox.clear();
                    await favoritesBox.clear();

                    context.read<FavoritesCubit>().emit(FavoritesInitial());
                    context.read<FetchProfileInfoCubit>().emit(
                      FetchProfileInfoInitial(),
                    );

                    await Supabase.instance.client.auth.signOut();
                    GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
                  },
                  color: AppColor.kMainColor,
                  title: 'Yes, logout',
                  textColor: AppColor.kCultured,
                ),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.0243),
          ],
        ),
      ),
    );
  }
}
