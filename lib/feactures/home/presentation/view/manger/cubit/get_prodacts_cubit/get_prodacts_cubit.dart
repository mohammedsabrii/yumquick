import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yumquick/core/loacl_data_source/loacl_data_source.dart';
import 'package:yumquick/core/service/get_prodact_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'get_prodacts_state.dart';

class GetProdactsCubit extends Cubit<GetProdactsState> {
  GetProdactsCubit() : super(GetProdactsInitial());
  final getProdactsService = GetProdactService();
  final loaclDataSource = LocalDataSourceImpl();

  Future<void> getProdacts() async {
    emit(GetProdactsLoading());
    try {
      final productsFromLocal = loaclDataSource.fetchProducts();
      if (productsFromLocal.isNotEmpty) {
        emit(GetProdactsSuccess(prodacts: productsFromLocal));
      }
      final products = await getProdactsService.getProdacts();
      var box = Hive.box<ProductsEntity>(kProductsBox);
      await box.clear();
      await box.addAll(products);
      emit(GetProdactsSuccess(prodacts: products));
    } catch (e) {
      emit(GetProdactsFaliure(errorMessage: e.toString()));
    }
  }
}
