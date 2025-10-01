import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yumquick/core/service/fetch_category_products_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'fetch_category_products_state.dart';

class GetCategoryProdactsCubit extends Cubit<GetCategoryProdactsState> {
  GetCategoryProdactsCubit() : super(GetCategoryProdactsInitial());

  final GetCategoryProdactService service = GetCategoryProdactService();
  final Map<String, List<ProductsEntity>> cachedProducts = {};

  Future<void> getCategoryProducts({
    required String categoryId,
    required int pageNumber,
    int limit = 10,
  }) async {
    try {
      emit(GetCategoryProdactsLoading());
      final box = Hive.box<ProductsEntity>(kCategoryProductsBox);
      final localProducts =
          box.values
              .where((product) => product.categoryId == categoryId)
              .toList();

      if (localProducts.isNotEmpty && pageNumber == 1) {
        cachedProducts[categoryId] = localProducts;
        emit(GetCategoryProdactsSuccess(categoryProducts: cachedProducts));
        return;
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

      if (pageNumber == 1) {
        await box.clear();
        await box.addAll(newProducts.take(10).toList());
      }
      emit(GetCategoryProdactsSuccess(categoryProducts: cachedProducts));
    } catch (e) {
      emit(GetCategoryProdactsFailure(errorMessage: e.toString()));
    }
  }
}
