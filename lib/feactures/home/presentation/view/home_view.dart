import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/search_cubit/search_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_cart.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_details.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_bloc_bulider.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/search_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget? currentDrawer;
  final supabase = Supabase.instance.client;
  void openDrawer(Widget drawer) {
    setState(() {
      currentDrawer = drawer;
    });
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
    _setupFCMListener();
  }

  Future<void> _setupFCMListener() async {
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        await FirebaseMessaging.instance.requestPermission();
        await FirebaseMessaging.instance.getAPNSToken();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          await setFcmToken(fcmToken);
        }
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await setFcmToken(fcmToken);
    });
    FirebaseMessaging.onMessage.listen((payload) {
      final notification = payload.notification;
      if (notification != null) {
        customShowSnackBar(
          context,
          title: '${notification.title} \n ${notification.body}',
        );
      }
    });
  }

  Future<void> setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser!.id;
    await supabase.from('profiles').upsert({
      'id': userId,
      'fcm_token': fcmToken,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: currentDrawer,
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            context.read<SearchCubit>().clearSearch();
          },

          child: Stack(
            children: [
              HomeViewBody(
                onOpenCartDrawer: () => openDrawer(const DrawerCart()),
                onOpenNotificationDrawer:
                    () => openDrawer(const NotificationDrawerBlocBulider()),
                onOpenUserDrawer: () => openDrawer(const DrawerDetails()),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).width * 0.06,
                left: MediaQuery.sizeOf(context).width * 0.089,
                child: const SearchWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
