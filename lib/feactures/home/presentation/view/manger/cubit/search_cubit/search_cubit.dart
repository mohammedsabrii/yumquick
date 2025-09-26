import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/search_service.dart';
import 'package:yumquick/feactures/home/entity/search_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final SearchService service = SearchService();
  void clearSearch() {
    emit(SearchInitial());
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final products = await service.getProducts(query);
      emit(SearchSuccess(products));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
