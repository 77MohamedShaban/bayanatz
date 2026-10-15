import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBlueBackground,
    drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
    dividerTheme: DividerThemeData(color: Colors.white, thickness: 1.h),
    colorScheme: ColorScheme.light(primary: AppColors.mainBlue),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.regular16Black,
      bodyMedium: AppTextStyles.poppins24SemiBoldBlue,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black38,
    colorScheme: ColorScheme.light(primary: AppColors.mainBlueDark),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.regular16Black,
      bodyMedium: AppTextStyles.poppins24SemiBoldBlue.copyWith(color: AppColors.white),
    ),
  );
}
