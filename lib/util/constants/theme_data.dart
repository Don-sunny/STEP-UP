import 'package:flutter/material.dart';
import 'package:step_up/util/constants/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: false,
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      cardColor: isDarkTheme ? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        color: isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.grey[300],
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
