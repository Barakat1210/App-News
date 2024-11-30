import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/presentation/screen/home/tabs/news/article_item_widget.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
   List<String> searchList = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(

        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchArticle(query),
      builder: (context, snapshot) {
        // أثناء انتظار نتيجة الـ Future
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        // إذا حدث خطأ أثناء تحميل البيانات
        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
            ),
          );
        }
        // إذا كان هناك بيانات
        if (snapshot.hasData) {
          var articlesResponse = snapshot.data as ArticlesResponse;
          // إذا كانت القائمة فارغة
          if (articlesResponse.articles == null ||
              articlesResponse.articles!.isEmpty) {
            return Center(
              child: Text('No results found'),
            );
          }
          // عرض قائمة المقالات
          return Container(
              decoration: BoxDecoration(
                image:DecorationImage(image:AssetImage(AssetsManager.pattern)),
              ),child: ListView.builder(
              itemBuilder: (context, index) => ArticleItemWidget(
                article: articlesResponse.articles![index],
              ),
              itemCount: articlesResponse.articles!.length,
            ),
          );
        }
        // حالة افتراضية (يجب ألا تصل إليها)
        return Center(
          child: Text('Unexpected state!'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? searchList
        : searchList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(image:AssetImage(AssetsManager.pattern)),
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              // عند اختيار اقتراح، يتم تحديث النص في حقل البحث
              query = suggestion;
              // عرض النتائج بناءً على الاقتراح المختار
              showResults(context);
            },
          );
        },
      ),
    );
  }
}
