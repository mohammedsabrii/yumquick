import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/service/auth_with_google_service.dart';
import 'package:yumquick/core/service/login_service.dart';
import 'package:yumquick/core/service/signup_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authWithGoogleService = AuthWithGoogleService();
  final signUpUserService = SignUpService();
  final logInService = LogInService();
  Future<void> authWithGoogle() async {
    emit(AuthLoading());
    try {
      await authWithGoogleService.signInWithGoogle();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
      print('🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑 $e');
    }
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String address,
    required String country,
    required DateTime dateOfBirth,
  }) async {
    emit(AuthLoading());
    try {
      signUpUserService.signUpUser(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        address: address,
        country: country,
        dateOfBirth: dateOfBirth,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> logInUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      logInService.logInUser(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
