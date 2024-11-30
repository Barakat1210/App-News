import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<String> language = ['Arabic', 'English'];
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.language,
              style: AppStyles.languageTxt,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: ColorsManager.white,
                border: Border.all(
                  width: 1,
                  color: ColorsManager.green,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      selectedLang,
                      style: AppStyles.selectedLang,
                    ),
                  ),
                  Spacer(),
                  DropdownButton<String>(
                      value: selectedLang,
                      items: language.map((lang) => DropdownMenuItem(
                        child: Text(lang),
                        value: lang,
                      )).toList(),
                      onChanged: (lang) {
                        setState(() {
                          selectedLang = lang!;
                        });
                      })
                  // DropdownButton<String>(
                  //   value: selectedLang,
                  //   items: language.map((String lang) {
                  //     return DropdownMenuItem<String>(
                  //       value: lang,
                  //       child: Text(lang),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? value) {
                  //     setState(() {
                  //       selectedLang = value!;
                  //     });
                  //   },
                  // )
                ],
              ),
            ),
          ]),
    );
  }
}
