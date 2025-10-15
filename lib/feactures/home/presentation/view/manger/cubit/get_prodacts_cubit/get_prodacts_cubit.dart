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
  List<ProductsEntity> allProducts = [];
  bool hasMore = true;

  Future<void> getProdacts({int? page}) async {
    if (!hasMore && page == null) return;

    final fetchPage = page ?? (currentPage + 1);
    if (page != null) {
      allProducts.clear();
      hasMore = true;
      emit(GetProdactsLoading(isFirstFetch: true));
    } else {
      emit(GetProdactsLoading(isFirstFetch: false));
    }

    try {
      // final productsFromLocal = localDataSource.fetchProducts();
      // if (productsFromLocal.isNotEmpty && page != null) {
      //   allProducts = productsFromLocal;
      //   emit(GetProdactsSuccess(products: allProducts));
      //   return;
      // }

      final products = await getProdactsService.getProdacts(
        page: fetchPage,
        pageSize: pageSize,
      );

      if (products.length < pageSize) {
        hasMore = false;
      }

      if (page != null) {
        allProducts = products;
      } else {
        allProducts.addAll(products);
      }

      // var box = Hive.box<ProductsEntity>(kProductsBox);
      // if (page != null) {
      //   await box.clear();
      // }
      // await box.addAll(products.take(10).toList());
      currentPage = fetchPage;
      emit(GetProdactsSuccess(products: allProducts));
    } catch (e) {
      emit(GetProdactsFailure(errorMessage: e.toString()));
    }
  }
}
