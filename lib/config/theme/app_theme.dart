import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppTheme{
  static final ThemeData light=ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.white,
      ),
      backgroundColor: ColorsManager.green,
    ),

  );
}