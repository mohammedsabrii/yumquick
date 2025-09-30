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
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.kOnPordingView);
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    } else {
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppAssets.kLogo1));
  }
}
