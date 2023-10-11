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
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        color: isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.grey[300],
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkTheme ? Colors.grey[300]! : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(5),
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
