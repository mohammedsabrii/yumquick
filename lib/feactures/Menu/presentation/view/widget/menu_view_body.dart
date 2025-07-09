import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/snacks_details.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/vigan_details.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_header.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({
    super.key,
    required this.onOpenCartDrawer,
    required this.onOpenNotificationDrawer,
    required this.onOpenUserDrawer,
  });
  final VoidCallback onOpenCartDrawer;
  final VoidCallback onOpenNotificationDrawer;
  final VoidCallback onOpenUserDrawer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0352),
        HomeViewHeader(
          onOpenCartDrawer: onOpenCartDrawer,
          onOpenNotificationDrawer: onOpenNotificationDrawer,
          onOpenUserDrawer: onOpenUserDrawer,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0316),

        const SnacksDetails(),
      ],
    );
  }
}
