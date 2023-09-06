import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ColorScheme darkTheme = ColorScheme.fromSeed(
    seedColor: const Color(0XFFF88379),
    background: const Color(0xff303030),
    brightness: Brightness.dark,
  );

  static ColorScheme lightTheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFD07746),
    brightness: Brightness.light,
  );

  static ThemeData colorSchemedThemeData({
    // required Brightness mode,
    required bool isDarkMode,
  }) {
    return isDarkMode
        ? ThemeData(
            colorScheme: darkTheme,
            appBarTheme: AppBarTheme(
              foregroundColor: darkTheme.primary,
              backgroundColor: darkTheme.surface,
              titleTextStyle:
                  GoogleFonts.pacifico(fontSize: 30, color: darkTheme.primary),
            ),
            tabBarTheme: TabBarTheme(
              unselectedLabelColor: darkTheme.primary,
              labelColor: darkTheme.surface,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white70, darkTheme.primary]),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: darkTheme.background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 1, color: darkTheme.onBackground),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 1, color: darkTheme.onBackground),
              ),
            ),
          )
        : ThemeData(
            colorScheme: lightTheme,
            appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.pacifico(fontSize: 30),
            ),
            tabBarTheme: TabBarTheme(
              unselectedLabelColor: lightTheme.onPrimary,
              labelColor: lightTheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: lightTheme.onPrimary,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          );
  }
}
