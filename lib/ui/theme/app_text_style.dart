import 'package:flutter/material.dart';
import 'package:race/ui/theme/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle largeHeader = TextStyle(
    color: AppColors.mainDarkFontColor,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mediumHeader = TextStyle(
    color: AppColors.mainDarkFontColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mediumGrayHeader = TextStyle(
    color: AppColors.mainGreyFontColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallHeader = TextStyle(
    color: AppColors.mainDarkFontColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle smallGrayHeader = TextStyle(
    color: AppColors.mainGreyFontColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle errorMessage = TextStyle(
    color: AppColors.mainRedFontColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle extraSmallHeader = TextStyle(
    color: AppColors.mainDarkFontColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle extraSmallHeaderGray = TextStyle(
    color: AppColors.mainGreyFontColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle extraSmallHeaderwhite = TextStyle(
    color: AppColors.mainWhiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
