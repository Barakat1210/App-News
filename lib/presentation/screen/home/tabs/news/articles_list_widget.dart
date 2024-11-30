import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/presentation/screen/home/tabs/news/article_item_widget.dart';
import 'package:news_app/presentation/screen/home/tabs/news/article_list_viewmodel.dart';
import 'package:provider/provider.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.source});
  Source source;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel = ArticlesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourcesId(widget.source.id??'');
  }
  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNewsBySourcesId(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
      if (viewModel.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (viewModel.errorMessage != null) {
        return Text(viewModel.errorMessage!);
      }
       List<Article> articles = viewModel.articles!;
      return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ArticleItemWidget(article: viewModel.articles![index]),
                    itemCount: viewModel.articles?.length,
                  ),);

    },
      ),
    );
    // return FutureBuilder(
    //     future: ApiManager.getArticles(source.id ?? ''),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //       if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //         return Text(snapshot.data?.message ?? 'Check internet connection');
    //       }
    //       List<Article> articles = snapshot.data?.articles ?? [];
    //       return Expanded(
    //         child: ListView.builder(
    //           itemBuilder: (context, index) =>
    //               ArticleItemWidget(article: articles[index]),
    //           itemCount: articles.length,
    //         ),
    //       );
    //     });
  }
}
