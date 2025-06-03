import 'package:flutter/material.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_view_body.dart';

class OnpordingView extends StatelessWidget {
  const OnpordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: OnpordingViewBody()));
  }
}
