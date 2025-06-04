import 'package:go_router/go_router.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/login_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/signup_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/start_view.dart';
import 'package:yumquick/feactures/onPording/presentation/views/onpording_view.dart';
import 'package:yumquick/feactures/splash/presentation/views/spalsh_view.dart';

class AppRouter {
  static const kOnPordingView = '/OnPordingView';
  static const kStartView = '/StartView';
  static const kLogInView = '/LogInView';
  static const kSignUpView = '/SignUpView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SpalshView()),
      GoRoute(
        path: kOnPordingView,
        builder: (context, state) => const OnpordingView(),
      ),
      GoRoute(path: kStartView, builder: (context, state) => const StartView()),
      GoRoute(path: kLogInView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
