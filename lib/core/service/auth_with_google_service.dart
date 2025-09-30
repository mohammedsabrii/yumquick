import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';

class AuthWithGoogleService {
  final supabase = Supabase.instance.client;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: googleAndroidClintId,
    serverClientId: googleWebClintSecret,
  );
  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken!,
      accessToken: accessToken,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    final user = response.user;
    await supabase.from('profiles').upsert({
      'id': user!.id,
      'username': googleUser.displayName ?? '',
      'profile_picture': googleUser.photoUrl ?? '',
      'email': googleUser.email,
      'country': null,
      'address': null,
      'date_of_birth': null,
      'phone': null,
    });
  }
}
