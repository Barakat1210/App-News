import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/roues_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/presentation/screen/article_details/article_details.dart';

class ArticleItemWidget extends StatelessWidget {
   ArticleItemWidget({super.key,required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.articleDetails,
        arguments: article
        );
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 8,vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage??'',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
              ),
            ),

            Text(article.source?.name??'',style:AppStyles.sourceNames.copyWith(color: ColorsManager.grey),),
            SizedBox(height: 2.h,),
            Text(article.description??'',style: AppStyles.description,),
            SizedBox(height: 2.h,),
            Text(article.publishedAt??'',textAlign: TextAlign.end,style: AppStyles.date,),
          ],
        ),
      ),
    );
  }
}
