part of 'favorite_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<ProductsEntity> favorites;
  FavoritesSuccess(this.favorites);
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesFailure extends FavoritesState {
  final String errorMessage;
  FavoritesFailure(this.errorMessage);
}
