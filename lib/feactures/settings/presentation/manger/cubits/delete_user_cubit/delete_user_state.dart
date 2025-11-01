part of 'delete_user_cubit.dart';

@immutable
sealed class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserSuccess extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserFaluire extends DeleteUserState {
  final String errorMessage;

  DeleteUserFaluire({required this.errorMessage});
}
