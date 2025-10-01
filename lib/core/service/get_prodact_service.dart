import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class GetProdactService {
  final supabase = Supabase.instance.client;

  Future<List<ProductsEntity>> getProdacts({
    required int page,
    required int pageSize,
  }) async {
    final response = await supabase
        .from('products')
        .select(
          'id, name, subtitle, image, price, categories, price_after_discount, category_id',
        )
        .range((page - 1) * pageSize, page * pageSize - 1);

    final products =
        (response as List).map((e) => ProductsEntity.fromJson(e)).toList();
    return products;
  }
}
