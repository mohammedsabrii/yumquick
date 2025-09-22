import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_offers_cubit/fetch_offers_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/get_prodacts_cubit/get_prodacts_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/login_cubit/login_cubit.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/signup_cubit/signup_cubit.dart';
import 'package:yumquick/feactures/my%20profile/presentation/manger/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';
import 'package:yumquick/feactures/settings/presentation/manger/cubits/change_password_cubit/change_password_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supbaseUrl, anonKey: supbaseAnonKey);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const YumQuick(),
    ),
  );
}

class YumQuick extends StatelessWidget {
  const YumQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(
          create: (context) => FetchProfileInfoCubit()..fetchProfileInfo(),
        ),
        BlocProvider(create: (context) => GetProdactsCubit()..getProdacts()),
        BlocProvider(create: (context) => FetchOffersCubit()..fetchOffers()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
