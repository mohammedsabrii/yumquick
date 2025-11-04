import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/grid_view_item.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';

class RecommendGridView extends StatefulWidget {
  const RecommendGridView({super.key});

  @override
  RecommendGridViewState createState() => RecommendGridViewState();
}

class RecommendGridViewState extends State<RecommendGridView> {
  final List<ProductsEntity> displayedProducts = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProdactsCubit, GetProdactsState>(
      listener: (context, state) {
        if (state is GetProdactsSuccess) {
          displayedProducts
            ..clear()
            ..addAll(state.products);
        }
      },
      builder: (context, state) {
        if (state is GetProdactsLoading && state.isFirstFetch) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            ),
          );
        } else if (state is GetProdactsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        }

        if (displayedProducts.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            ),
          );
        }

        final cubit = BlocProvider.of<GetProdactsCubit>(context);

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index < displayedProducts.length) {
                return GridViewItem(productsEntity: displayedProducts[index]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: AppColor.kMainColor),
                );
              }
            },
            childCount:
                cubit.hasMore
                    ? displayedProducts.length + 1
                    : displayedProducts.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
        );
      },
    );
  }
}
