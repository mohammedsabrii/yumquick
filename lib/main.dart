import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/manger/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/cubit/cubit/fetch_category_products_cubit.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_offers_cubit/fetch_offers_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/search_cubit/search_cubit.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/login_cubit/auth_cubit.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';
import 'package:yumquick/feactures/settings/presentation/manger/cubits/change_password_cubit/change_password_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OffersEntityAdapter());
  Hive.registerAdapter(ProductsEntityAdapter());
  Hive.registerAdapter(ProfileEntityAdapter());
  await Hive.openBox<OffersEntity>(kOffersBox);
  await Hive.openBox<ProductsEntity>(kProductsBox);
  await Hive.openBox<ProfileEntity>(kProfileBox);
  await Hive.openBox<ProductsEntity>(kCategoryProductsBox);
  await Hive.openBox<String>(kFavoritesBox);
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supbaseUrl, anonKey: supbaseAnonKey);
  runApp(const YumQuick());
}

class YumQuick extends StatelessWidget {
  const YumQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => EditProfileCubit()..fetchProfile()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(
          create: (context) => FetchProfileInfoCubit()..fetchProfileInfo(),
        ),
        BlocProvider(create: (context) => GetProdactsCubit()..getProdacts()),
        BlocProvider(create: (context) => FetchOffersCubit()..fetchOffers()),
        BlocProvider(create: (context) => FavoritesCubit()..fetchFavorites()),
        BlocProvider(create: (context) => CartsCubit()..fetchFromCarts()),
        BlocProvider(
          create: (context) => ActiveOrdersCubit()..fetchActiveOrders(),
        ),

        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => GetCategoryProdactsCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
