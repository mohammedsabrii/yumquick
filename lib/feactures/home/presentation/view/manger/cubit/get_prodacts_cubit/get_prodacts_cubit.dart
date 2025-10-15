import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/get_prodact_service.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'get_prodacts_state.dart';

class GetProdactsCubit extends Cubit<GetProdactsState> {
  GetProdactsCubit() : super(GetProdactsInitial());
  final GetProdactService getProdactsService = GetProdactService();

  int currentPage = 0;
  final int pageSize = 10;
  bool hasMore = true;
  bool isLoading = false;
  final List<ProductsEntity> allProducts = [];

  Future<void> getProdacts({int page = 1, bool isRefresh = false}) async {
    if (isLoading) return;
    isLoading = true;

    if (isRefresh) {
      allProducts.clear();
      currentPage = 0;
      hasMore = true;
      emit(GetProdactsLoading(isFirstFetch: true));
    } else if (page == 1 && allProducts.isEmpty) {
      emit(GetProdactsLoading(isFirstFetch: true));
    } else {
      emit(GetProdactsLoading(isFirstFetch: false));
    }

    try {
      final products = await getProdactsService.getProdacts(
        page: page,
        pageSize: pageSize,
      );

      if (products.isEmpty || products.length < pageSize) {
        hasMore = false;
      }

      final newProducts = products.where(
        (p) => !allProducts.any((existing) => existing.id == p.id),
      );

      allProducts.addAll(newProducts);
      currentPage = page;
      emit(GetProdactsSuccess(products: List.from(allProducts)));
    } catch (e) {
      emit(GetProdactsFailure(errorMessage: e.toString()));
    } finally {
      isLoading = false;
    }
  }
}
