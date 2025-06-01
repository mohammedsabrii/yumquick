import 'package:flutter/material.dart';
import 'package:yumquick/feactures/splash/presentation/views/spalsh_view.dart';

void main() {
  runApp(const YumQuick());
}

class YumQuick extends StatelessWidget {
  const YumQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SpalshView());
  }
}
