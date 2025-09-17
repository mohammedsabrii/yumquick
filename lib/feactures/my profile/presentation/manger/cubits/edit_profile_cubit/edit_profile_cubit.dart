import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  Future<void> fetchProfile() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;

      final data =
          await supabase.from('profiles').select().eq('id', userId!).single();

      emit(
        EditProfileSuccess(
          name: data['username'] ?? '',
          email: data['email'] ?? '',
          phone: data['phone'] ?? '',
          address: data['address'] ?? '',
          cuntry: data['country'] ?? '',
        ),
      );
    } catch (e) {
      emit(EditProfileFailure(errorMassage: e.toString()));
    }
  }

  Future<void> editPrifile(
    BuildContext context, {
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String country,
  }) async {
    emit(EditProfileLoading());
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;
      final updateProfileInfo = {
        'username': name,
        'phone': phoneNumber,
        'email': email,
        'address': address,
        'country': country,
      };
      await supabase
          .from('profiles')
          .update(updateProfileInfo)
          .eq('id', userId!);

      emit(
        EditProfileSuccess(
          address: address,
          cuntry: country,
          email: email,
          name: name,
          phone: phoneNumber,
        ),
      );
    } on AuthApiException catch (e) {
      emit(EditProfileFailure(errorMassage: e.toString()));
      customShowSnackBar(context, title: e.toString());
    }
  }

  void updateLocalData(
    BuildContext context, {
    String? newName,
    String? newEmail,
    String? newPhone,
    String? newAddress,
    String? newCountry,
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
        ),
      );
    }
  }
}
