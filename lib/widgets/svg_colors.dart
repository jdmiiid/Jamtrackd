// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class SvgColors extends ConsumerWidget {
//   SvgColors(this.svgName, {super.key});

//   final String svgName;
//   final primaryColor = svgName == '' ? '#333' : '#666';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String primaryColor = Theme.of(context)
//         .colorScheme
//         .primary
//         .value
//         .toRadixString(16)
//         .substring(2);
//     final String surfaceColor = Theme.of(context)
//         .colorScheme
//         .surface
//         .value
//         .toRadixString(16)
//         .substring(2);
//     final String secondary = Theme.of(context)
//         .colorScheme
//         .onErrorContainer
//         .value
//         .toRadixString(16)
//         .substring(2);
//     final String highlight = isDarkMode ? '7e94f8' : '55ae64';
//     final String blackOrWhite = isDarkMode ? 'e6e6e6' : '2f2e41';
//   }
// }
