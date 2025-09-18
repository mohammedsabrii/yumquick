import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UplodeImageService {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<String> updateImageToSupabase(
    XFile imageFile,
    String storageName,
  ) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';
    final filePath = '$storageName/$fileName';
    final bytes = await imageFile.readAsBytes();

    await supabase.storage.from(storageName).updateBinary(filePath, bytes);

    return supabase.storage.from(storageName).getPublicUrl(filePath);
  }
}
