import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';

part 'auth_with_goole_state.dart';

class AuthWithGoogleCubit extends Cubit<AuthWithGoogleState> {
  AuthWithGoogleCubit() : super(AuthWithGoogleInitial());
  final supabase = Supabase.instance.client;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: googleClintId,
    serverClientId: googleClintId,
  );

  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    emit(AuthWithGoogleLodaing());
    try {
      final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken!,
        accessToken: accessToken,
      );
      final user = response.user;
      emit(AuthWithGoogleSuccess(user: user));
    } catch (e) {
      emit(AuthWithGoogleFailure(errorMessage: e.toString()));
    }
  }
}
