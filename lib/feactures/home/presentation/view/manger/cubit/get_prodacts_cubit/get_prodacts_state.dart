part of 'get_prodacts_cubit.dart';

@immutable
sealed class GetProdactsState {}

final class GetProdactsInitial extends GetProdactsState {}

final class GetProdactsSuccess extends GetProdactsState {
  final List<ProductsEntity> prodacts;

  GetProdactsSuccess({required this.prodacts});
}

final class GetProdactsLoading extends GetProdactsState {}

final class GetProdactsFaliure extends GetProdactsState {
  final String errorMessage;

  GetProdactsFaliure({required this.errorMessage});
}
