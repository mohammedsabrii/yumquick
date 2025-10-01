part of 'fetch_category_products_cubit.dart';

@immutable
abstract class GetCategoryProdactsState {}

class GetCategoryProdactsInitial extends GetCategoryProdactsState {}

class GetCategoryProdactsLoading extends GetCategoryProdactsState {}

class GetCategoryProdactsSuccess extends GetCategoryProdactsState {
  final Map<String, List<ProductsEntity>> categoryProducts;
  GetCategoryProdactsSuccess({required this.categoryProducts});
}

class GetCategoryProdactsFailure extends GetCategoryProdactsState {
  final String errorMessage;
  GetCategoryProdactsFailure({required this.errorMessage});
}
