import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/get_prodact_service.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'get_prodacts_state.dart';

class GetProdactsCubit extends Cubit<GetProdactsState> {
  GetProdactsCubit() : super(GetProdactsInitial());
  final getProdactsService = GetProdactService();
  Future<void> getProdacts() async {
    emit(GetProdactsLoading());
    try {
      final prodacts = await getProdactsService.getProdacts();
      emit(GetProdactsSuccess(prodacts: prodacts));
    } catch (e) {
      emit(GetProdactsFaliure(errorMessage: e.toString()));
    }
  }
}
