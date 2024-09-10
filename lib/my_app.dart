import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_theme_data.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/news_details_screen.dart';
import 'package:news_app/ui/splash_screen.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
    );
  }
}
