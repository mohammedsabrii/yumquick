import 'package:hive/hive.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

abstract class LocalDataSource {
  List<ProfileEntity> fetchProfileInfo();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  List<ProfileEntity> fetchProfileInfo() {
    var box = Hive.box<ProfileEntity>(kProfileBox);
    return box.values.toList();
  }
}
