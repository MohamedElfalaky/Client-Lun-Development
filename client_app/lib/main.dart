import 'package:client_app/app/theme.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/Local/local_cubit.dart';
import 'package:client_app/data/cubits/Login_cubit/login_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/data/cubits/NewPassWord/new_pass_word_cubit_cubit.dart';
import 'package:client_app/data/cubits/ResetPassWord/reset_password_cubit.dart';
import 'package:client_app/data/cubits/cubit/check_phone_cubit.dart';
import 'package:client_app/data/cubits/cubit/check_verfification_cubit.dart';
import 'package:client_app/data/cubits/debug/app_bloc_observer.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/Home/Home.dart';
import 'package:client_app/presentation/screens/Home/components/DeliveryPickupAlert.dart';
import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/OnBoarding.dart';
import 'package:client_app/presentation/screens/Registration/Registeration.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

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
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              builder: (context, child) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: 1200,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(
                    800,
                    name: TABLET,
                  ),
                  const ResponsiveBreakpoint.autoScale(1000,
                      name: TABLET, scaleFactor: 1.3),
                  const ResponsiveBreakpoint.autoScale(2460, name: DESKTOP),
                  const ResponsiveBreakpoint.resize(2460, name: "4K"),
                ],
              ),
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
              },
              home: Home(),
            );
          });
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
