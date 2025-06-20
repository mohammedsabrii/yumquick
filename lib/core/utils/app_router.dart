import 'package:go_router/go_router.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/add_new_address_view.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/delivery_address_view.dart';
import 'package:yumquick/feactures/Payment%20Methods/presentation/view/payment_methods_view.dart';
import 'package:yumquick/feactures/home/presentation/view/home_view.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/my_orders_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_widget.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancel_order_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/login_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/signup_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/start_view.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/my_profile_view.dart';
import 'package:yumquick/feactures/onPording/presentation/views/onpording_view.dart';
import 'package:yumquick/feactures/splash/presentation/views/spalsh_view.dart';

class AppRouter {
  static const kOnPordingView = '/OnPordingView';
  static const kStartView = '/StartView';
  static const kLogInView = '/LogInView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kDrawer = '/Drawer';
  static const kMyOrders = '/MyOrders';
  static const kCancelOrderView = '/CancelOrderView';
  static const kMyProfileView = '/MyProfileView';
  static const kDeliveryAddress = '/DeliveryAddress';
  static const kAddNewAddess = '/AddNewAddress';
  static const kPaymentMethods = '/PaymentMethods';

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
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kDrawer, builder: (context, state) => const DrawerWidget()),
      GoRoute(
        path: kMyOrders,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: kCancelOrderView,
        builder: (context, state) => const CancelOrderView(),
      ),
      GoRoute(
        path: kMyProfileView,
        builder: (context, state) => const MyProfileView(),
      ),
      GoRoute(
        path: kDeliveryAddress,
        builder: (context, state) => const DeliveryAddressView(),
      ),
      GoRoute(
        path: kAddNewAddess,
        builder: (context, state) => const AddNewAddressView(),
      ),
      GoRoute(
        path: kPaymentMethods,
        builder: (context, state) => const PaymentMethodsView(),
      ),
    ],
  );
}
