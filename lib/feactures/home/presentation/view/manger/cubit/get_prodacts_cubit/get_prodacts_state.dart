part of 'get_prodacts_cubit.dart';

@immutable
abstract class GetProdactsState {}

class GetProdactsInitial extends GetProdactsState {}

class GetProdactsLoading extends GetProdactsState {
  final bool isFirstFetch;
  GetProdactsLoading({required this.isFirstFetch});
}

class GetProdactsSuccess extends GetProdactsState {
  final List<ProductsEntity> products;
  GetProdactsSuccess({required this.products});
}

class GetProdactsFailure extends GetProdactsState {
  final String errorMessage;
  GetProdactsFailure({required this.errorMessage});
}
