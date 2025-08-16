import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword(
    BuildContext context, {
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) async {
    final supabase = Supabase.instance.client;

    final userEmail = supabase.auth.currentUser?.email;

    if (currentPassword!.isEmpty ||
        newPassword!.isEmpty ||
        confirmPassword!.isEmpty) {
      emit(ChangePasswordFaluire(errorMassage: 'Please fill all fields'));
      customShowSnackBar(context, title: 'Please fill all fields');
      return;
    }

    if (newPassword.length < 6) {
      emit(
        ChangePasswordFaluire(
          errorMassage: 'Password must be at least 6 characters',
        ),
      );
      customShowSnackBar(
        context,
        title: 'Password must be at least 6 characters',
      );
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ChangePasswordFaluire(errorMassage: 'Passwords do not match'));
      customShowSnackBar(context, title: 'Passwords do not match');
      return;
    }

    emit(ChangePasswordLoading());

    try {
      final loginResponse = await supabase.auth.signInWithPassword(
        email: userEmail,
        password: currentPassword,
      );

      if (loginResponse.user == null) {
        emit(
          ChangePasswordFaluire(errorMassage: 'Current password is incorrect'),
        );
        customShowSnackBar(context, title: 'Current password is incorrect');
        return;
      }

      final res = await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      if (res.user != null) {
        emit(ChangePasswordSuccess());
        customShowSnackBar(context, title: 'Success');
      } else {
        emit(ChangePasswordFaluire(errorMassage: 'Failed to update password'));
        customShowSnackBar(context, title: 'Failed to update password');
      }
    } catch (e) {
      emit(ChangePasswordFaluire(errorMassage: 'Error: $e'));
    }
  }
}
