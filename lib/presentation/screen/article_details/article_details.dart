import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleDetails extends StatefulWidget {
  ArticleDetails({
    super.key,
  });

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  var article=Article();
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(AssetsManager.pattern))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            article.title ?? '',
            style: AppStyles.appBar,
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50.r))),
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(vertical: 20, horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(article.urlToImage ?? ""),
              ),
              Text(
                article.source?.name ?? '',
                style:
                    AppStyles.sourceNames.copyWith(color: ColorsManager.grey),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                article.description ?? '',
                style: AppStyles.description,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                article.publishedAt ?? '',
                textAlign: TextAlign.end,
                style: AppStyles.date,
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.content ?? '',
                  textAlign: TextAlign.start,
                  style: AppStyles.content,
                ),
              ),
              TextButton(
                  onPressed: ()async {
                    String url=article.url??'';
                    if (await canLaunchUrlString(url)) {
                      launchUrlString(url, mode: LaunchMode.externalApplication);

                    }else{
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    "View Full Article",textAlign: TextAlign.end,
                    style: AppStyles.description,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

}
