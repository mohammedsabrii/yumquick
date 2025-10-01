import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/grid_view_item.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';

class RecommendGridView extends StatefulWidget {
  const RecommendGridView({super.key});

  @override
  RecommendGridViewState createState() => RecommendGridViewState();
}

class RecommendGridViewState extends State<RecommendGridView> {
  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    context.read<GetProdactsCubit>().getProdacts(page: 1);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      context.read<GetProdactsCubit>().getProdacts(
        page: null,
      ); // Fetch next page
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProdactsCubit, GetProdactsState>(
      listener: (context, state) {
        if (state is GetProdactsSuccess) {
          setState(() {
            isLoadingMore = false;
          });
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
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is GetProdactsSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index < state.products.length) {
                return GridViewItem(productsEntity: state.products[index]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: AppColor.kMainColor),
                );
              }
            }, childCount: state.products.length + (isLoadingMore ? 1 : 0)),
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
