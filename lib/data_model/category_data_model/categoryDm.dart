import 'dart:ui';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDM(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});
  static List<CategoryDM> getAllCategories() => [
        CategoryDM(
          id: ConstantsManager.sportBackEndId,
          title: StringsManager.sport,
          bgColor: ColorsManager.bgSports,
          imagePath: AssetsManager.sportsImage,
        ),
        CategoryDM(
            id: ConstantsManager.generalBackEndId,
            title: StringsManager.general,
            bgColor: ColorsManager.bgGeneral,
            imagePath: AssetsManager.generalImage),
        CategoryDM(
            id: ConstantsManager.healthBackEndId,
            title: StringsManager.health,
            bgColor: ColorsManager.bgHealth,
            imagePath: AssetsManager.healthImage),
        CategoryDM(
            id: ConstantsManager.businessBackEndId,
            title: StringsManager.business,
            bgColor: ColorsManager.bgBusiness,
            imagePath: AssetsManager.businessImage),
        CategoryDM(
            id: ConstantsManager.entertainmentBackEndId,
            title: StringsManager.entertainment,
            bgColor: ColorsManager.bgEntertainment,
            imagePath: AssetsManager.entertainmentImage),
        CategoryDM(
            id: ConstantsManager.scienceBackEndId,
            title: StringsManager.science,
            bgColor: ColorsManager.bgScience,
            imagePath: AssetsManager.scienceImage),
        CategoryDM(
            id: ConstantsManager.technologyBackEndId,
            title: StringsManager.technology,
            bgColor: ColorsManager.bgTechnology,
            imagePath: AssetsManager.technologyImage),
      ];
}
