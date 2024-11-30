import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/my_app/my_app.dart';

class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static TextStyle drawerTitle= GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle drawerItem= GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle pickCategory= GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.blackWhite);
  static TextStyle categoryTitle= GoogleFonts.exo(
      fontSize: 21.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static TextStyle languageTxt= GoogleFonts.poppins(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle sourceName= GoogleFonts.exo(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: ColorsManager.green);
  static TextStyle sourceNames= GoogleFonts.poppins(
      fontSize: 10.sp, fontWeight: FontWeight.w400, color: ColorsManager.grey);
  static TextStyle description  = GoogleFonts.poppins(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorsManager.black);
  static TextStyle content = GoogleFonts.poppins(
      fontSize: 13.sp, fontWeight: FontWeight.w400, color: ColorsManager.black);
  static TextStyle date = GoogleFonts.inter(
      fontSize: 13.sp, fontWeight: FontWeight.w400, color: Color(0xFFA3A3A3),);
  static TextStyle selectedLang = GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.green,);


}
