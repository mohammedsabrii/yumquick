import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signInUser(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    emit(SignupLoading());
    try {
      final supabase = Supabase.instance.client;
      final AuthResponse user = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      await Supabase.instance.client.from('profiles').insert({
        'username': name,
        'phone': phoneNumber,
        'email': email,
        'id': user.user!.id,
      });
      emit(SignupSuccess());
    } on AuthApiException catch (e) {
      if (e.code == 'weak-password') {
        customShowSnackBar(
          context,
          title: 'The password provided is too weak.',
        );
        emit(SignupFailure(errorMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        customShowSnackBar(
          context,
          title: 'The account already exists for that email.',
        );
        emit(SignupFailure(errorMassage: 'email-already-in-use'));
      }
    } catch (e) {
      customShowSnackBar(context, title: e.toString());
      print(e.toString());
      emit(SignupFailure(errorMassage: e.toString()));
    }
  }
}
