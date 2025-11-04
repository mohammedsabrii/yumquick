import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DateOfBirthField extends StatelessWidget {
  const DateOfBirthField({
    super.key,
    this.onChanged,
    this.onPressed,
    this.dateController,
    this.validator,
  });

  final VoidCallback? onChanged;
  final VoidCallback? onPressed;
  final TextEditingController? dateController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> fieldState) {
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
                border: Border.all(
                  color:
                      fieldState.hasError
                          ? Colors.red
                          : const Color(0xFFF3E9B5),
                  width: 2,
                ),
                color: const Color(0xFFF3E9B5),
              ),
              child: TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: onPressed,
                onChanged: (value) => onChanged?.call(),
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
              ),
            ),
            if (fieldState.hasError)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fieldState.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
