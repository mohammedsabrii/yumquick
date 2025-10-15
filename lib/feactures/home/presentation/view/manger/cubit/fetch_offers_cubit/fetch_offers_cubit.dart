import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/fetch_offer_service.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'fetch_offers_state.dart';

class FetchOffersCubit extends Cubit<FetchOffersState> {
  FetchOffersCubit() : super(FetchOffersInitial());
  final FetchOfferService getProdactsService = FetchOfferService();

  Future<void> getOffers() async {
    emit(FetchOffersLoading());
    try {
      final offer = await getProdactsService.getOffers();
      emit(FetchOffersSuccess(products: offer));
    } catch (e) {
      emit(FetchOffersFailure(errorMessage: e.toString()));
    }
  }
}
