import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/service/uplode_image_service.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final UplodeImageService uplodeImageSrevice = UplodeImageService();

  Future<void> fetchProfile() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        emit(EditProfileFailure(errorMessage: 'User not authenticated'));
        return;
      }

      final data =
          await supabase.from('profiles').select().eq('id', userId).single();

      emit(
        EditProfileSuccess(
          name: data['username'] ?? '',
          email: data['email'] ?? '',
          phone: data['phone'] ?? '',
          address: data['address'] ?? '',
          cuntry: data['country'] ?? '',
          profilePicture: data['profile_picture'] ?? '',
        ),
      );
    } catch (e) {
      emit(EditProfileFailure(errorMessage: e.toString()));
    }
  }

  Future<void> editPrifile(
    BuildContext context, {
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String country,
    XFile? image,
  }) async {
    emit(EditProfileLoading());
    try {
      String? imageUrl;

      if (image != null && await File(image.path).exists()) {
        imageUrl = await uplodeImageSrevice.updateImageToSupabase(
          image,
          'profiles',
        );
      }

      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        emit(EditProfileFailure(errorMessage: 'User not authenticated'));
        customShowSnackBar(context, title: 'User not authenticated');
        return;
      }

      final updateProfileInfo = {
        'username': name,
        'phone': phoneNumber,
        'email': email,
        'address': address,
        'country': country,
      };

      if (imageUrl != null) {
        updateProfileInfo['profile_picture'] = imageUrl;
      }

      await supabase
          .from('profiles')
          .update(updateProfileInfo)
          .eq('id', userId);

      emit(
        EditProfileSuccess(
          address: address,
          cuntry: country,
          email: email,
          name: name,
          phone: phoneNumber,
          profilePicture:
              imageUrl ??
              (state is EditProfileSuccess
                  ? (state as EditProfileSuccess).profilePicture
                  : ''),
        ),
      );
    } on AuthApiException catch (e) {
      emit(EditProfileFailure(errorMessage: e.toString()));
      customShowSnackBar(context, title: e.toString());
    } catch (e) {
      emit(EditProfileFailure(errorMessage: 'Failed to update profile: $e'));
      customShowSnackBar(context, title: 'Failed to update profile: $e');
    }
  }

  void updateLocalData(
    BuildContext context, {
    String? newName,
    String? newEmail,
    String? newPhone,
    String? newAddress,
    String? newCountry,
    String? newProfilePicture,
  }) {
    if (state is EditProfileSuccess) {
      final currentState = state as EditProfileSuccess;
      emit(
        EditProfileSuccess(
          name: newName ?? currentState.name,
          email: newEmail ?? currentState.email,
          phone: newPhone ?? currentState.phone,
          address: newAddress ?? currentState.address,
          cuntry: newCountry ?? currentState.cuntry,
          profilePicture: newProfilePicture ?? currentState.profilePicture,
        ),
      );
    }
  }
}
