// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> logInUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final supabase = Supabase.instance.client;
      await supabase.auth.signInWithPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      if (e.code == 'user-not-found') {
        customShowSnackBar(context, title: 'User not Found');
        emit(LoginFailure(errorMassage: 'User not Found'));
      } else if (e.code == 'wrong-password') {
        customShowSnackBar(context, title: 'wrong-password');
        emit(LoginFailure(errorMassage: 'wrong password'));
      } else if (e.code == 'invalid-credential') {
        emit(LoginFailure(errorMassage: 'invalid credential'));

        customShowSnackBar(context, title: 'invalid credential');
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure(errorMassage: 'invalid email'));
        customShowSnackBar(context, title: 'invalid email');
      } else {
        customShowSnackBar(context, title: e.toString());
        emit(LoginFailure(errorMassage: e.toString()));
      }
    }
  }
}
