import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category_data_model/categoryDm.dart';
import 'package:news_app/presentation/screen/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screen/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screen/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screen/home/widget/home_drawer/home_drawer.dart';
import 'tabs/news/custom_search_delegate.dart';
class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget;
  List<CategoryDM> categories = CategoryDM.getAllCategories();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(
      onCategoryItemClicked: onCategoryClicked,
    );
  }

  String title = StringsManager.appTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(AssetsManager.pattern))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: AppStyles.appBar,
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50.r))),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(
                Icons.search,
                size: 50,
              ),
            )
          ],
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onCategoryClicked(index) {
    selectedWidget = CategoryDetails(
      index: index,
      categoryDM: categories[index],
    );
    title = categories[index].title;
    setState(() {});
  }

  void onDrawerItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.Categries:
        {
          selectedWidget = CategoriesTab(
            onCategoryItemClicked: onCategoryClicked,
          );
        }
      case MenuItem.Settings:
        {
          selectedWidget = SettingsTab();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }
}
