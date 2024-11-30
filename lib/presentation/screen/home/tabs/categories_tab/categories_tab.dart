import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/category_data_model/categoryDm.dart';
import 'package:news_app/presentation/screen/home/tabs/categories_tab/category_widget/cateory_widget.dart';

typedef OnCategoryItemClicked=void Function(int );

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key, required this.onCategoryItemClicked});

  OnCategoryItemClicked onCategoryItemClicked;
  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
      child: Column(
        children: [
          Text(
            'Pick your category \nof interest',
            style: AppStyles.pickCategory,
          ),
          SizedBox(
            height: 29,
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: () {
                      onCategoryItemClicked(index);
                    },
                    child: CategoryWidgets(
                        categoryDM: categoriesList[index], index: index),
                  ),
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
