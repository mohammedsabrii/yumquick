import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class FetchOfferService {
  final supabase = Supabase.instance.client;
  Future<List<ProductsEntity>> getOffers() async {
    final response = await supabase
        .from('products')
        .select(
          'id, name, subtitle, image, price, categories, price_after_discount, category_id',
        );

    final offer =
        (response as List).map((e) => ProductsEntity.fromJson(e)).toList();
    return offer;
  }
}
