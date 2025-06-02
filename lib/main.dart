import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_router.dart';

void main() {
  runApp(const YumQuick());
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
