import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_constant.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/login_cubit/login_cubit.dart';
import 'package:yumquick/feactures/logInAndSignUp/presentation/manger/cubit/signup_cubit/signup_cubit.dart';

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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
