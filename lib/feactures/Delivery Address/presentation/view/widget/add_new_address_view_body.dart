import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/add_new_address_view_detiles.dart';

class AddNewAddressViewBody extends StatelessWidget {
  const AddNewAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0499),
        CustomPageHeader(
          title: 'Add New Address',
          space: MediaQuery.sizeOf(context).width * 0.1017,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const AddNewAddressViewDetiles(),
      ],
    );
  }
}
