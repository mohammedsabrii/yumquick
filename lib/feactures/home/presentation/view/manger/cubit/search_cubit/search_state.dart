part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<SearchEntity> searchResults;
  SearchSuccess(this.searchResults);
}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure(this.errorMessage);
}
