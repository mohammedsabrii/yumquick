import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/search/presentation/view/widget/search_resulet_details.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        CustomPageHeader(
          title: 'Search',
          space: MediaQuery.sizeOf(context).width * 0.29,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        const SearchResultDetails(),
      ],
    );
  }
}
