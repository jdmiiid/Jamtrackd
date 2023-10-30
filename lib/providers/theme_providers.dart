import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/misc_providers.dart';

part 'theme_providers.g.dart';

class SvgColors {
  final String primaryColor;
  final String surfaceColor;
  final String secondary;
  final String highlight;
  final String blackOrWhite;

  SvgColors(this.primaryColor, this.surfaceColor, this.secondary,
      this.highlight, this.blackOrWhite);
}

@riverpod
SvgColors svgColors(SvgColorsRef ref, ThemeData currentTheme) {
  final bool isDarkMode = ref.watch(themeProvider);
  return SvgColors(
    currentTheme.colorScheme.primary.value.toRadixString(16).substring(2),
    currentTheme.colorScheme.surface.value.toRadixString(16).substring(2),
    currentTheme.colorScheme.secondary.value.toRadixString(16).substring(2),
    isDarkMode ? '7e94f8' : '55ae64',
    isDarkMode ? 'e6e6e6' : '2f2e41',
  );
}
