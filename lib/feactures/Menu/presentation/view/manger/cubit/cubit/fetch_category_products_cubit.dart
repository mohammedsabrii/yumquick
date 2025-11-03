import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/fetch_category_products_service.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'fetch_category_products_state.dart';

class GetCategoryProdactsCubit extends Cubit<GetCategoryProdactsState> {
  GetCategoryProdactsCubit() : super(GetCategoryProdactsInitial());

  final GetCategoryProdactService service = GetCategoryProdactService();
  final Map<String, List<ProductsEntity>> cachedProducts = {};
  final Map<String, int> pageNumbers = {};
  final Map<String, bool> isLoading = {};
  final Map<String, bool> hasMore = {};

  void initializeCategories(List<String> categoryIds) {
    for (var id in categoryIds) {
      if (!cachedProducts.containsKey(id)) {
        pageNumbers[id] = 1;
        isLoading[id] = false;
        hasMore[id] = true;
        getCategoryProducts(categoryId: id, pageNumber: 1);
      }
    }
  }

  Future<void> getCategoryProducts({
    required String categoryId,
    required int pageNumber,
    int limit = 10,
  }) async {
    if (isLoading[categoryId] == true || hasMore[categoryId] == false) return;

    try {
      isLoading[categoryId] = true;
      if (pageNumber == 1) {
        emit(GetCategoryProdactsLoading());
      }

      final newProducts = await service.getCategoryProducts(
        categoryId: categoryId,
        pageNumber: pageNumber,
        limit: limit,
      );
      final current = cachedProducts[categoryId] ?? [];
      final ids = current.map((e) => e.id).toSet();
      final unique = [
        ...current,
        ...newProducts.where((p) => !ids.contains(p.id)),
      ];
      cachedProducts[categoryId] = unique;

      if (newProducts.length < limit) {
        hasMore[categoryId] = false;
      }
      pageNumbers[categoryId] = pageNumber;

      emit(GetCategoryProdactsSuccess(categoryProducts: cachedProducts));
    } catch (e) {
      emit(GetCategoryProdactsFailure(errorMessage: e.toString()));
    } finally {
      isLoading[categoryId] = false;
    }
  }

  Future<void> loadMore(String categoryId) async {
    final nextPage = (pageNumbers[categoryId] ?? 1) + 1;
    await getCategoryProducts(categoryId: categoryId, pageNumber: nextPage);
  }
}
