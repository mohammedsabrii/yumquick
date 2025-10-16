import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';
import 'package:yumquick/feactures/Contact%20Us/presentation/view/widget/web_view_screen_body.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBouttonNavigationBar(),
        backgroundColor: Colors.white,
        body: WebViewScreenBody(title: title, url: url),
      ),
    );
  }
}
