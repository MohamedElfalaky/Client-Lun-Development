import 'package:client_app/app/theme.dart';
import 'package:client_app/data/cubits/BalanceCubit/BalanceCubit.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/Local/local_cubit.dart';
import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/data/cubits/NewPassWord/new_pass_word_cubit_cubit.dart';
import 'package:client_app/data/cubits/PopularCubit/PopularCubit.dart';
import 'package:client_app/data/cubits/ResetPassWord/reset_password_cubit.dart';
import 'package:client_app/data/cubits/SearchCubit/SearchCubit.dart';
import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/data/cubits/cubit/check_verfification_cubit.dart';
import 'package:client_app/data/cubits/cubit/create_acc_cubit.dart';
import 'package:client_app/data/cubits/cubit/order_dart_cubit.dart';
import 'package:client_app/data/cubits/cubit/order_details_cubit.dart';
import 'package:client_app/data/cubits/debug/app_bloc_observer.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/Home/Home.dart';
import 'package:client_app/presentation/screens/MyOrders/MyOrders.dart';
import 'package:client_app/presentation/screens/MyWallet/MyWalletScreen.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/OnBoarding.dart';
import 'package:client_app/presentation/screens/OrderDetails/OrderDetails.dart';
import 'package:client_app/presentation/screens/Registration/Registeration.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:client_app/presentation/screens/SettingsScreen/SettingsScreen.dart';
import 'package:client_app/presentation/widgets/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:one_context/one_context.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  CacheHelper.saveBoolToShared(
      "showHome", false); // بمسح الكاش بتاع الاونبوردنج
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 0));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalCubit()..getSavedLanguage()),
        BlocProvider<CheckPhoneCubit>(create: (context) => CheckPhoneCubit()),
        BlocProvider<CheckVerfificationCubit>(
            create: (context) => CheckVerfificationCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<NewPassWordCubit>(create: (context) => NewPassWordCubit()),
        BlocProvider<ResetPasswordCubit>(
            create: (context) => ResetPasswordCubit()),
        BlocProvider<LastOrdersCubit>(create: (context) => LastOrdersCubit()),
        BlocProvider<NearbyCubit>(create: (context) => NearbyCubit()),
        BlocProvider<PopularCubit>(create: (context) => PopularCubit()),
        BlocProvider<BalanceCubit>(create: (context) => BalanceCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<CreateAccCubit>(
          create: (context) => CreateAccCubit(),
        ),
        BlocProvider<OrderDartCubit>(create: (context) => OrderDartCubit()),
        BlocProvider<OrderDetailsCubit>(
            create: (context) => OrderDetailsCubit()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          
            return MaterialApp(
              builder: (context, child) {
                child = ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, child!),
                  maxWidth: 1200,
                  minWidth: 450,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(450, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.autoScale(1000,
                        name: TABLET, scaleFactor: 1.3),
                    const ResponsiveBreakpoint.autoScale(2460, name: DESKTOP),
                    const ResponsiveBreakpoint.resize(2460, name: "4K"),
                  ],
                );
                child = OneContext().builder(context, child);
                return child;
              },
              debugShowCheckedModeBanner: false,

              locale:
                  state is ChangeLocaleState ? state.local : const Locale('en'),
              // const Locale('ar'),
              supportedLocales: const [
                Locale('en'),
                Locale('ar')
              ], //Localization
              localizationsDelegates: const [
                AppLocalizations
                    .delegate, // Localization basedon mobile defaulte language
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              title: 'Flutter Demo',
              theme: myTheme,
              routes: {
                // '/': (context) => const LogIn(),
                '/splash': (context) => const Splash(),
                '/register': (context) => const Registration(),
                '/sendOTP': (context) => SendOTP(),
                '/onboarding': (context) => const OnBoarding(),
                '/registration': (context) => const Registration(),
                "/drawer": (context) => const DrawerScreen(),
                "/orders": (context) => const MyOrdersScreen(),
                "/orderDetails": (context) => const OrderDetailsScreen(),
                "/myWallet": (context) => const MyWallet(),
                "/settings": (context) => const SettingsScreen(),
              },
              home: const Home(),
            );
         
        },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
}
