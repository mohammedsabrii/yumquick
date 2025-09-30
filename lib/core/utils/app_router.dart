import 'package:go_router/go_router.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/contact_us_view.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/add_new_address_view.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/delivery_address_view.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/favorite_view.dart';
import 'package:yumquick/feactures/Menu/presentation/view/menu_view.dart';
import 'package:yumquick/feactures/Payment%20Methods/presentation/view/payment_methods_view.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/confirm_order_view.dart';
import 'package:yumquick/feactures/home/presentation/view/confirmed_order_view.dart';
import 'package:yumquick/feactures/home/presentation/view/delivery_time_view.dart';
import 'package:yumquick/feactures/home/presentation/view/home_view.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/my_orders_view.dart';
import 'package:yumquick/feactures/home/presentation/view/more_best_seller_view.dart';
import 'package:yumquick/feactures/home/presentation/view/offers_details_view.dart';
import 'package:yumquick/feactures/home/presentation/view/payment_view.dart';
import 'package:yumquick/feactures/home/presentation/view/prodact_details_view.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/cancel_order_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/login_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/signup_view.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/views/start_view.dart';
import 'package:yumquick/feactures/my%20profile/presentation/view/my_profile_view.dart';
import 'package:yumquick/feactures/onPording/presentation/views/onpording_view.dart';
import 'package:yumquick/feactures/settings/presentation/view/notification_settings_view.dart';
import 'package:yumquick/feactures/settings/presentation/view/password_settings_view.dart';
import 'package:yumquick/feactures/settings/presentation/view/settings_view.dart';
import 'package:yumquick/feactures/splash/presentation/views/spalsh_view.dart';

class AppRouter {
  static const kOnPordingView = '/OnPordingView';
  static const kStartView = '/StartView';
  static const kLogInView = '/LogInView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kProdactDetailsView = '/ProdactDetailsView';
  static const kOfferDetailsView = '/OffersDetailsView';
  static const kMoreBestSellerView = '/MoreBestSellerView';
  static const kMenuView = '/MenuView';
  static const kFavoriteView = '/FavoriteView';
  static const kDrawer = '/Drawer';
  static const kMyOrders = '/MyOrders';
  static const kCancelOrderView = '/CancelOrderView';
  static const kMyProfileView = '/MyProfileView';
  static const kDeliveryAddress = '/DeliveryAddress';
  static const kAddNewAddess = '/AddNewAddress';
  static const kPaymentMethods = '/PaymentMethods';
  static const kContactUs = '/ContactUs';
  static const kSettings = '/Settings';
  static const kPasswordSettings = '/PasswordSettings';
  static const kNotificationSettings = '/NotificationSettings';
  static const kConfirmOrderView = '/ConfirmOrderView';
  static const kPaymentView = '/PaymentView';
  static const kConfirmedOrderView = '/ConfirmedOrderView';
  static const kDeliverytimeView = '/DeliverytimeView';
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

      GoRoute(
        path: kProdactDetailsView,
        builder:
            (context, state) => ProdactDetailsView(
              productsEntity: state.extra as ProductsEntity,
            ),
      ),
      GoRoute(
        path: kOfferDetailsView,
        builder:
            (context, state) =>
                OffersDetailsView(offersEntity: state.extra as OffersEntity),
      ),
      GoRoute(
        path: kMoreBestSellerView,
        builder: (context, state) => const MoreBestSellerView(),
      ),
      GoRoute(path: kMenuView, builder: (context, state) => const MenuView()),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) => const FavoriteView(),
      ),

      GoRoute(path: kDrawer, builder: (context, state) => const CustomDrawer()),
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
      GoRoute(
        path: kContactUs,
        builder: (context, state) => const ContactUsView(),
      ),
      GoRoute(
        path: kSettings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: kPasswordSettings,
        builder: (context, state) => const PasswordSettingsView(),
      ),
      GoRoute(
        path: kNotificationSettings,
        builder: (context, state) => const NotificationSettingsView(),
      ),
      GoRoute(
        path: kConfirmOrderView,
        builder: (context, state) => const ConfirmOrderView(),
      ),
      GoRoute(
        path: kPaymentView,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: kConfirmedOrderView,
        builder: (context, state) => const ConfirmedOrderView(),
      ),
      GoRoute(
        path: kDeliverytimeView,
        builder: (context, state) => const DeliveryTimeView(),
      ),
    ],
  );
}
