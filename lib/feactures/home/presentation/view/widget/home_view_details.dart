import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_details_body.dart';

class HomeViewDetiles extends StatelessWidget {
  const HomeViewDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.only(
          top: mediaQuery.height * 0.0234,
          left: mediaQuery.width * 0.091,
          right: mediaQuery.width * 0.091,
        ),
        child: const HomeViewDetilesBody(),
      ),
    );
  }
}
