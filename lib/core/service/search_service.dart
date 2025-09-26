import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/search_entity.dart';

class SearchService {
  final supabase = Supabase.instance.client;
  Future<List<SearchEntity>> getProducts(String query) async {
    final response = await supabase
        .from('products')
        .select(
          'id, name, subtitle, image, price, categories, price_after_discount, category_id',
        )
        .ilike('name', '%$query%');
    final products =
        (response as List).map((e) => SearchEntity.fromJson(e)).toList();
    return products;
  }
}
