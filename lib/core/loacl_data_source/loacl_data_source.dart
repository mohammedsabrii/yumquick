import 'package:hive/hive.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

abstract class LocalDataSource {
  List<ProductsEntity> fetchProducts();
  List<ProfileEntity> fetchProfileInfo();
  List<OffersEntity> fetchOffers();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  List<OffersEntity> fetchOffers() {
    var box = Hive.box<OffersEntity>(kOffersBox);
    return box.values.toList();
  }

  @override
  List<ProductsEntity> fetchProducts() {
    var box = Hive.box<ProductsEntity>(kProductsBox);
    return box.values.toList();
  }

  @override
  List<ProfileEntity> fetchProfileInfo() {
    var box = Hive.box<ProfileEntity>(kProfileBox);
    return box.values.toList();
  }
}
