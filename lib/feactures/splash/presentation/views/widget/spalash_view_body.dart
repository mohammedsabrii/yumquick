import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      GoRouter.of(context).pushReplacement(AppRouter.kOnPordingView);
      return;
    }
    User? user = Supabase.instance.client.auth.currentUser;
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (user != null && isLoggedIn == true) {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      print('user id is : ${user.id}');
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppAssets.kLogo1));
  }
}
