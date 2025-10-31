import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/menu_view_body.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_details.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_empty_cart.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_bloc_bulider.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/search_widget.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  Widget? currentDrawer;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        backgroundColor: AppColor.kYellowBase,
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        body: Stack(
          children: [
            MenuViewBody(
              onOpenCartDrawer: () => openDrawer(const DrawerEmptyCart()),
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
    );
  }
}
