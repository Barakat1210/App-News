import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/data_model/category_data_model/categoryDm.dart';
import 'package:news_app/presentation/screen/home/tabs/category_details/category_details_viewmodel.dart';
import 'package:news_app/presentation/screen/home/tabs/category_details/widget/sources_widget/source_item_widget.dart';
import 'package:news_app/presentation/screen/home/tabs/category_details/widget/sources_widget/sources_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  int? index;
  final CategoryDM categoryDM;
  CategoryDetails({super.key, required this.categoryDM, this.index});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDatailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CategoryDatailsViewModel>(builder: (context, value, child) {
        if (viewModel.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (viewModel.errorMessage != null) {
          return Center(
            child: Text(viewModel.errorMessage!),
          );
        }
        return SourcesTabWidget(sources: viewModel.sources!);
      },),
    );
    // return FutureBuilder(
    //     future: ApiManager.getSources(widget.categoryDM.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //         return Text(snapshot.data?.message ?? snapshot.error.toString());
    //       }
    //       List<Source> source = snapshot.data!.sources!;
    //       return SourcesWidget(sources: source);
    //     });
  }
}
