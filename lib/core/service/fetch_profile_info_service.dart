import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

class FetchProfileInfoService {
  final supabase = Supabase.instance.client;

  Future<ProfileEntity?> fetchProfileInfo() async {
    final userId = supabase.auth.currentUser?.id;
    final response =
        await supabase
            .from('profiles')
            .select(
              'username, profile_picture, country, address, date_of_birth, email, phone, id',
            )
            .eq('id', userId!)
            .maybeSingle();

    return ProfileEntity.fromJson(response!);
  }
}
