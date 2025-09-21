import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class GetProdactService {
  final supabase = Supabase.instance.client;
  Future<List<ProductsEntity>> getProdacts() async {
    final response = await supabase
        .from('products')
        .select(
          'id, name, subtitle, image, price, categories, price_after_discount',
        );
    final prodacts =
        (response as List).map((e) => ProductsEntity.fromJson(e)).toList();
    return prodacts;
  }
}
