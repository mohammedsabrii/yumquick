import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/search_cubit/search_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_search_text_field.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/search_results_list_tile.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            Widget? suffixIcon;

            if (state is SearchLoading) {
              suffixIcon = const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: 20,
                  child: CircularProgressIndicator(color: AppColor.kMainColor),
                ),
              );
            } else {
              suffixIcon = const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.search, color: AppColor.kMainColor),
              );
            }

            return CustomSaerchTextField(
              suffixIcon: suffixIcon,
              hintText: 'Search',
              onFieldSubmitted: (value) {
                BlocProvider.of<SearchCubit>(context).searchProducts(value);
              },
              onChanged: (value) {
                BlocProvider.of<SearchCubit>(context).searchProducts(value);
              },
            );
          },
        ),
        const SizedBox(height: 10),

        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess) {
              if (state.searchResults.isEmpty) {
                return const Text('No results found');
              }
              return Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.76,
                  child: ListView.builder(
                    itemCount: state.searchResults.length,
                    itemBuilder: (context, index) {
                      return SearchResultsListTile(
                        productsEntity: state.searchResults[index],
                      );
                    },
                  ),
                ),
              );
            } else if (state is SearchFailure) {
              return Text("Error: ${state.errorMessage}");
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
