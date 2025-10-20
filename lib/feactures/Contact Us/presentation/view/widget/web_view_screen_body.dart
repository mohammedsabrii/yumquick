import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class WebViewScreenBody extends StatelessWidget {
  const WebViewScreenBody({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mq.height * 0.01),
        Row(
          children: [
            SizedBox(width: mq.width * 0.109),
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
                  style: AppStyles.styleLeagueSpartanBold24(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: mq.height * 0.01),
        Expanded(
          child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri(url))),
        ),
      ],
    );
  }
}
