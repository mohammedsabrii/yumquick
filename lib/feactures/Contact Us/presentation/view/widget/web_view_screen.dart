import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_boutton_navigation_bar.dart';

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
        body: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            Row(
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.109),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    AppAssets.kBackIcon,
                    height: 25,
                    width: 20,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: AppStyles.styleLeagueSpartanBold28(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(url)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
