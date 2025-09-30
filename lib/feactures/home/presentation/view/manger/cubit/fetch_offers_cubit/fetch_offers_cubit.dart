import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumquick/core/loacl_data_source/loacl_data_source.dart';
import 'package:yumquick/core/service/fetch_offer_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

part 'fetch_offers_state.dart';

class FetchOffersCubit extends Cubit<FetchOffersState> {
  FetchOffersCubit() : super(FetchOffersInitial());
  final fetchOfferService = FetchOfferService();
  final loaclDataSource = LocalDataSourceImpl();

  Future<void> fetchOffers() async {
    emit(FetchOffersLoading());
    try {
      final offersFromLocal = loaclDataSource.fetchOffers();
      if (offersFromLocal.isNotEmpty) {
        emit(FetchOffersSuccess(offerEntity: offersFromLocal));
      }
      final offers = await fetchOfferService.getOffers();
      var box = Hive.box<OffersEntity>(kOffersBox);
      await box.clear();
      await box.addAll(offers);
      emit(FetchOffersSuccess(offerEntity: offers));
    } catch (e) {
      emit(FetchOffersFailure(errorMessage: e.toString()));
    }
  }
}
