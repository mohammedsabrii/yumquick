import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  Future<void> editPrifile(BuildContext context) async {
    emit(EditProfileLoading());
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;

      final response =
          await supabase
              .from('profiles')
              .select('username, phone, email')
              .eq('id', userId!)
              .single();

      emit(
        EditProfileSuccess(
          name: response['username'] ?? '',
          email: response['email'] ?? '',
          phone: response['phone'] ?? '',
        ),
      );
      customShowSnackBar(context, title: 'Success');
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
  }) {
    if (state is EditProfileSuccess) {
      final currentState = state as EditProfileSuccess;
      emit(
        EditProfileSuccess(
          name: newName ?? currentState.name,
          email: newEmail ?? currentState.email,
          phone: newPhone ?? currentState.phone,
        ),
      );
    }
  }
}
