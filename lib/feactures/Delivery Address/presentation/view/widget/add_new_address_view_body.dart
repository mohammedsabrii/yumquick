import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Delivery%20Address/presentation/view/widget/add_new_address_view_detiles.dart';

class AddNewAddressViewBody extends StatelessWidget {
  const AddNewAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: mq.height * 0.0499),
        CustomPageHeader(title: 'Add New Address', space: mq.width * 0.1017),
        SizedBox(height: mq.height * 0.034),
        const AddNewAddressViewDetiles(),
      ],
    );
  }
}
