import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

class FetchOfferService {
  final supabase = Supabase.instance.client;
  Future<List<OffersEntity>> getOffers() async {
    final response = await supabase
        .from('offers')
        .select(
          'id, offer_name, product_name, subtitle, image, category, price, price_after_discount',
        );

    final offer =
        (response as List).map((e) => OffersEntity.fromJson(e)).toList();
    return offer;
  }
}
