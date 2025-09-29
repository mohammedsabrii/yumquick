part of 'auth_with_goole_cubit.dart';



@immutable
sealed class AuthWithGoogleState {}

final class AuthWithGoogleInitial extends AuthWithGoogleState {}

final class AuthWithGoogleSuccess extends AuthWithGoogleState {
    final User? user;

  AuthWithGoogleSuccess({required this.user});

}

final class AuthWithGoogleLodaing extends AuthWithGoogleState {



}

final class AuthWithGoogleFailure extends AuthWithGoogleState {
  final String errorMessage;

  AuthWithGoogleFailure({required this.errorMessage});
}
