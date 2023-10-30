import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootSVGPicture extends ConsumerWidget {
  // final Color backgroundColor = Colors.red;
  final String svgString;

  /// you can add more fields that meet your needs

  const RootSVGPicture({super.key, required this.svgString});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: SvgPicture.string(svgString,
          height: MediaQuery.of(context).size.height * 0.225,
          width: MediaQuery.of(context).size.width * 0.225),
    );
  }
}
