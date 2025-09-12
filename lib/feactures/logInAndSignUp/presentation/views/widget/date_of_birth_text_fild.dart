import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DateOfBirthField extends StatelessWidget {
  const DateOfBirthField({
    super.key,
    this.onTap,
    this.onPressed,
    this.dateController,
  });
  final Function()? onTap;
  final Function()? onPressed;
  final TextEditingController? dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of birth',
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const SizedBox(height: 10),
        Container(
          height: 45,
          width: MediaQuery.sizeOf(context).width * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0xFFF3E9B5),
          ),
          child: TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              hintText: 'YYYY-MM-DD',
              suffixIcon: IconButton(
                icon: const Icon(FontAwesomeIcons.solidCalendar),
                onPressed: onPressed,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Color(0xFFF3E9B5)),
                gapPadding: 12,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Color(0xFFF3E9B5)),

                gapPadding: 12,
              ),
            ),
            readOnly: true,
            onTap: onTap,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
