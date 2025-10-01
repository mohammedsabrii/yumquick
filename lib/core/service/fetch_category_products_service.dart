import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class GetCategoryProdactService {
  final supabase = Supabase.instance.client;

  Future<List<ProductsEntity>> getCategoryProducts({
    required String categoryId,
    required int pageNumber,
    int limit = 10,
  }) async {
    final from = (pageNumber - 1) * limit;
    final to = pageNumber * limit - 1;

    final response = await supabase
        .from('products')
        .select(
          'id, name, subtitle, image, price, categories, price_after_discount, category_id',
        )
        .eq('category_id', categoryId)
        .range(from, to);

    return (response as List).map((e) => ProductsEntity.fromJson(e)).toList();
  }
}
