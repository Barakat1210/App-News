import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/category_data_model/categoryDm.dart';

class CategoryWidgets extends StatelessWidget {
  CategoryDM categoryDM;
  int index;
  CategoryWidgets({super.key, required this.categoryDM, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.bgColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven ? 25 : 0),
            bottomRight: Radius.circular(index.isEven ? 0 : 25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath,fit:BoxFit.cover,width: 132.w,height: 116.h,),
          Text(categoryDM.title,style: AppStyles.categoryTitle,),

        ],
      ),
    );
  }
}
