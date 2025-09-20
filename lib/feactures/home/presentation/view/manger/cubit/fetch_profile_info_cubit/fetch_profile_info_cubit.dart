import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/service/fetch_profile_info_service.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

part 'fetch_profile_info_state.dart';

class FetchProfileInfoCubit extends Cubit<FetchProfileInfoState> {
  FetchProfileInfoCubit() : super(FetchProfileInfoInitial());
  final profileService = FetchProfileInfoService();

  Future<void> fetchProfileInfo() async {
    emit(FetchProfileInfoLoading());
    try {
      final profile = await profileService.fetchProfileInfo();

      emit(FetchProfileInfoSuccess(profile: profile!));
    } catch (e) {
      emit(FetchProfileInfoFaliure(errorMessage: e.toString()));
    }
  }
}
