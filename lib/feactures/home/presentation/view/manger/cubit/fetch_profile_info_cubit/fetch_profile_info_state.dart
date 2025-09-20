part of 'fetch_profile_info_cubit.dart';

@immutable
sealed class FetchProfileInfoState {}

final class FetchProfileInfoInitial extends FetchProfileInfoState {}

final class FetchProfileInfoSuccess extends FetchProfileInfoState {
  final ProfileEntity profile;

  FetchProfileInfoSuccess({required this.profile});
}

final class FetchProfileInfoLoading extends FetchProfileInfoState {}

final class FetchProfileInfoFaliure extends FetchProfileInfoState {
  final String errorMessage;

  FetchProfileInfoFaliure({required this.errorMessage});
}
