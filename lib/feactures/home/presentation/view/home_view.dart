import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_details.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_empty_cart.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_body.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notifications_drawer_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget? currentDrawer;

  void openDrawer(Widget drawer) {
    setState(() {
      currentDrawer = drawer;
    });
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: currentDrawer,
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: HomeViewBody(
          onOpenCartDrawer: () => openDrawer(const DrawerEmptyCart()),
          onOpenNotificationDrawer:
              () => openDrawer(const NotificationDrawerDetails()),
          onOpenUserDrawer: () => openDrawer(const DrawerDetails()),
        ),
      ),
    );
  }
}
