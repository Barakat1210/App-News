import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/screen/article_details/article_details.dart';
import 'package:news_app/presentation/screen/home/tabs/news/custom_search_delegate.dart';
import 'package:news_app/presentation/screen/splash/splash_screen.dart';
import 'package:news_app/presentation/screen/home/home_screen.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';
  static const String articleDetails='/articleDetails';
  static Map<String,WidgetBuilder>routes={
    splash:(_)=>Splash(),
    home:(_)=>Home(),
    articleDetails:(_)=>ArticleDetails(),
  };
}