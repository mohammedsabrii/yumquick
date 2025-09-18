part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final String name;
  final String email;
  final String phone;
  final String cuntry;
  final String address;
  final String profilePicture;

  EditProfileSuccess({
    required this.name,
    required this.email,
    required this.phone,
    required this.cuntry,
    required this.address,
    required this.profilePicture,
  });
}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileFailure extends EditProfileState {
  final String errorMassage;

  EditProfileFailure({required this.errorMassage});
}
