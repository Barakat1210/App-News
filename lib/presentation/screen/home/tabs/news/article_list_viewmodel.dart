import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:provider/provider.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article>?articles;
  String? errorMessage;
  bool isLoading=false;
  void getNewsBySourcesId(String sourceId)async{
    try{
      isLoading=true;
      notifyListeners();
      var response=await ApiManager.getArticles(sourceId);
      isLoading=false;
      if(response.status=='ok'){
        articles=response.articles;
        notifyListeners();
      }else{
        errorMessage=response.message;
        notifyListeners();
      }
    }catch(e){
      isLoading=false;
      errorMessage='Check Internet Connection';
      notifyListeners();
    }
  }
}