import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/fetch_offer_service.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

part 'fetch_offers_state.dart';

class FetchOffersCubit extends Cubit<FetchOffersState> {
  FetchOffersCubit() : super(FetchOffersInitial());
  final fetchOfferService = FetchOfferService();
  Future<void> fetchOffers() async {
    emit(FetchOffersLoading());
    try {
      final offers = await fetchOfferService.getOffers();
      emit(FetchOffersSuccess(offerEntity: offers));
    } catch (e) {
      emit(FetchOffersFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
