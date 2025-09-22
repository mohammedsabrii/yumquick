import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/grid_view_item.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';

class RecommendGridView extends StatelessWidget {
  const RecommendGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProdactsCubit, GetProdactsState>(
      builder: (context, state) {
        if (state is GetProdactsLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            ),
          );
        } else if (state is GetProdactsFaliure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is GetProdactsSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GridViewItem(productsEntity: state.prodacts[index]);
            }, childCount: state.prodacts.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            ),
          );
        }
      },
    );
  }
}
