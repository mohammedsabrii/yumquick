import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/favorite_widget.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/rate_widget.dart';

class FavoriteAndRateWidget extends StatelessWidget {
  const FavoriteAndRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [RateWidget(), SizedBox(width: 5), FavoriteWidget()],
    );
  }
}
