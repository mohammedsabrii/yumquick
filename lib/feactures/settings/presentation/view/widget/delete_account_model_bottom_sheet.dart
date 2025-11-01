import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/settings/presentation/manger/cubits/delete_user_cubit/delete_user_cubit.dart';

class DeleteAccountModelBottomSheet extends StatelessWidget {
  const DeleteAccountModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to delete your account?\nIf you delete your account, you will not be able to recover your data.',
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanBold20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShowModalBottomSheetBottom(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  title: 'Cancel',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
                BlocConsumer<DeleteUserCubit, DeleteUserState>(
                  listener: (context, state) {
                    if (state is DeleteUserSuccess) {
                      customShowSnackBar(
                        context,
                        title: 'Delete acount success ',
                      );
                    } else if (state is DeleteUserFaluire) {
                      customShowSnackBar(context, title: state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return CustomShowModalBottomSheetBottom(
                      onTap: () async {
                        await BlocProvider.of<DeleteUserCubit>(
                          context,
                        ).deleteAccount();

                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRouter.kLogInView);
                      },
                      text:
                          state is DeleteUserLoading
                              ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.kCultured,
                                ),
                              )
                              : Text(
                                'Delete any way',
                                style: AppStyles.styleLeagueSpartanMediem20(
                                  context,
                                ).copyWith(color: AppColor.kCultured),
                              ),
                      color: AppColor.kMainColor,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
