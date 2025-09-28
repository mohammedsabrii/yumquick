import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yumquick/core/loacl_data_source/loacl_data_source.dart';
import 'package:yumquick/core/service/fetch_profile_info_service.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

part 'fetch_profile_info_state.dart';

class FetchProfileInfoCubit extends Cubit<FetchProfileInfoState> {
  FetchProfileInfoCubit() : super(FetchProfileInfoInitial());
  final profileService = FetchProfileInfoService();
  final loaclDataSource = LocalDataSourceImpl();
  Future<void> fetchProfileInfo() async {
    emit(FetchProfileInfoLoading());
    try {
      final profileFromLocal = loaclDataSource.fetchProfileInfo();
      if (profileFromLocal.isNotEmpty) {
        emit(FetchProfileInfoSuccess(profile: profileFromLocal.first));
      }

      final profile = await profileService.fetchProfileInfo();
      var box = Hive.box<ProfileEntity>(kProfileBox);
      await box.clear();
      await box.add(profile!);
      emit(FetchProfileInfoSuccess(profile: profile));
    } catch (e) {
      emit(FetchProfileInfoFaliure(errorMessage: e.toString()));
    }
  }
}
