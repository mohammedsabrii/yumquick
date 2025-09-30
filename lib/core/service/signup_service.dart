import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpService {
  final supabase = Supabase.instance.client;
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
      'date_of_birth': dateOfBirth.toIso8601String(),
      'address': address,
      'country': country,
      'id': user.user!.id,
    });
  }
}
