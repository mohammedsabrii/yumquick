import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_details_body.dart';

class HomeViewDetiles extends StatelessWidget {
  const HomeViewDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.0234,
          left: MediaQuery.sizeOf(context).width * 0.091,
          right: MediaQuery.sizeOf(context).width * 0.091,
        ),
        child: const HomeViewDetilesBody(),
      ),
    );
  }
}
