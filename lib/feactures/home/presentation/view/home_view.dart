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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget? _currentDrawer;

  void _openDrawer(Widget drawer) {
    setState(() {
      _currentDrawer = drawer;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: _currentDrawer,
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: AppColor.kYellowBase,
        body: HomeViewBody(
          onOpenCartDrawer: () => _openDrawer(const DrawerEmptyCart()),
          onOpenNotificationDrawer:
              () => _openDrawer(const NotificationDrawerDetails()),
          onOpenUserDrawer: () => _openDrawer(const DrawerDetails()),
        ),
      ),
    );
  }
}
