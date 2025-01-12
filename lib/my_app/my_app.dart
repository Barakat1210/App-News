import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/utils/roues_manager.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(412, 870),minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.splash,
        theme:AppTheme.light,
        themeMode: ThemeMode.light,
      ),
    );
  }
}