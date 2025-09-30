// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/login_cubit/auth_cubit.dart';

class SignUpWithFacebookAndGmail extends StatelessWidget {
  SignUpWithFacebookAndGmail({super.key, this.isLoding});
  bool? isLoding = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              isLoding = false;
            } else if (state is AuthFailure) {
              customShowSnackBar(context, title: state.errorMessage);
              isLoding = false;
            } else if (state is AuthLoading) {
              isLoding = true;
            }
          },
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).authWithGoogle();
            },
            child: SvgPicture.asset(AppAssets.kGoogleIcon),
          ),
        ),
        const SizedBox(width: 9),
        SvgPicture.asset(AppAssets.kFacebookIcon),
      ],
    );
  }
}
