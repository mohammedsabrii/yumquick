import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const YumQuick(),
    ),
  );
}

class YumQuick extends StatelessWidget {
  const YumQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
