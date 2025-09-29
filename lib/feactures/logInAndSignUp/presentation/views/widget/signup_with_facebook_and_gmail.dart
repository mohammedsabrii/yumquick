import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/auth_with_goole_cubit/auth_with_goole_cubit.dart';

class SignUpWithFacebookAndGmail extends StatelessWidget {
  const SignUpWithFacebookAndGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<AuthWithGoogleCubit>(context).signInWithGoogle();
          },
          child: SvgPicture.asset(AppAssets.kGoogleIcon),
        ),
        const SizedBox(width: 9),
        SvgPicture.asset(AppAssets.kFacebookIcon),
      ],
    );
  }
}
