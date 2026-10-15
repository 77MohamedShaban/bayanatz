import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTextStyles {
  // Existing Styles
  static TextStyle regular16White = GoogleFonts.afacadFlux(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  
  static TextStyle regular16Black = GoogleFonts.pacifico(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle roboto20White = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle roboto16Yellow = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xFFF6BD00),
  );

  static TextStyle roboto16White = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  // Evently Redesign Tokens (Poppins)
  static TextStyle poppins24SemiBoldBlue = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins14RegularGrey = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.secondaryGrey,
  );

  static TextStyle poppins14SemiBoldBlue = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins20MediumWhite = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );

  static TextStyle poppins16MediumBlue = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins18MediumBlue = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.mainBlue,
  );

  static TextStyle poppins14SemiBoldBlueUnderline = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.mainBlue,
    decoration: TextDecoration.underline,
  );
}
