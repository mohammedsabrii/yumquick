import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class DateOfBirthField extends StatefulWidget {
  const DateOfBirthField({super.key});

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

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
            controller: _dateController,
            decoration: InputDecoration(
              hintText: 'YYYY-MM-DD',
              suffixIcon: IconButton(
                icon: const Icon(FontAwesomeIcons.solidCalendar),
                onPressed: () => _selectDate(context),
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
            onTap: () => _selectDate(context),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
