


import 'package:easy_localization/easy_localization.dart';

import 'Data/DataSource/Resources/imports.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  await SharedPrefs.init();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ar', 'AR'),
      ],
      saveLocale: true,
      startLocale: const Locale('en', 'EN'),
      path:'assets/translation',child: MultiBlocProvider(providers: appProviders, child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'STC HEALTH',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            //home: const LoginScreen(),
            home: const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

