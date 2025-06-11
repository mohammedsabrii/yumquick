import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_detiles_body.dart';

class HomeViewDetiles extends StatelessWidget {
  const HomeViewDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.091,
        ),
        child: const HomeViewDetilesBody(),
      ),
    );
  }
}
