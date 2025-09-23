part of 'fetch_offers_cubit.dart';

@immutable
sealed class FetchOffersState {}

final class FetchOffersInitial extends FetchOffersState {}

final class FetchOffersLoading extends FetchOffersState {}

final class FetchOffersFailure extends FetchOffersState {
  final String errorMessage;

  FetchOffersFailure({required this.errorMessage});
}

final class FetchOffersSuccess extends FetchOffersState {
  final List<OffersEntity> offerEntity;

  FetchOffersSuccess({required this.offerEntity});
}
