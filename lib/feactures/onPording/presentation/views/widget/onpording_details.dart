import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_details_body.dart';

class OnpordingDetails extends StatelessWidget {
  const OnpordingDetails({
    super.key,
    required this.title,
    required this.supTitle,
    required this.icon,
    required this.cruntPageIndex,
    this.onTap,
  });
  final String title, supTitle, icon;
  final int cruntPageIndex;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: const ShapeDecoration(
        color: Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: OnPordingDetailsBody(
        icon: icon,
        title: title,
        supTitle: supTitle,
        cruntPageIndex: cruntPageIndex,
        onTap: onTap,
      ),
    );
  }
}
