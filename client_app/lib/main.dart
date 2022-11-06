import 'package:client_app/data/cubits/Local/local_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 0));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalCubit()..getSavedLanguage()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: TABLET),
                const ResponsiveBreakpoint.autoScale(2460, name: DESKTOP),
                const ResponsiveBreakpoint.resize(2460, name: "4K"),
              ],
            ),
            debugShowCheckedModeBanner: false,

            locale:
                state is ChangeLocaleState ? state.local : const Locale('en'),
            // const Locale('ar'),
            supportedLocales: const [Locale('en'), Locale('ar')], //Localization
            localizationsDelegates: const [
              AppLocalizations
                  .delegate, // Localization basedon mobile defaulte language
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],

            // لو لغة الهاتف مدعومه ف الاب بتاعي حطها لو لا حط اول لغه
            // localeResolutionCallback: ((deviceLocale, supportedLocales) {
            //   for (var local in supportedLocales) {
            //     if (deviceLocale != null &&
            //         deviceLocale.languageCode == local.languageCode) {
            //       return deviceLocale;
            //     }
            //     return supportedLocales.first;
            //   }
            // }),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              // '/': (context) => const LogIn(),
              '/splash': (context) => Splash(),
            },
            home: Splash(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.tr(context)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
