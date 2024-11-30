import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
typedef OnDrawerItemClicked=void Function(MenuItem);
class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key,required this.onDrawerItemClicked});
  OnDrawerItemClicked onDrawerItemClicked;
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 110.h,
          color: ColorsManager.green,
            child: Text(StringsManager.drawerTitle,style: AppStyles.drawerTitle,)),
        SizedBox(height: 25.h,),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            InkWell(
              onTap: () {
                onDrawerItemClicked (MenuItem.Categries);
              },
              child: Row(
                children: [
                  Icon(Icons.list,size: 33.sp,),
                  SizedBox(width: 16.w,),
                  Text(StringsManager.category,style: AppStyles.drawerItem,),
                ],
              ),
            ),
            SizedBox(height: 18.h,),
            InkWell(
              onTap:  () {
                onDrawerItemClicked(MenuItem.Settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: 33.sp,),
                  SizedBox(width: 10.w,),
                  Text(StringsManager.settings,style: AppStyles.drawerItem,),
                ],
              ),
            ),
          ],),
        ),
      ],
    ),
          );
  }
}
enum MenuItem{
  Categries,Settings
}
