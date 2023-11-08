import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/misc_providers.dart';

class ToggleButtonsForSearch extends ConsumerWidget {
  const ToggleButtonsForSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedToggleIndex = ref.watch(selectedToggleIndexProvider);
    final List<bool> userChoiceBools = [
      false,
      false
    ]; // Initialize with the same length as your buttons

    userChoiceBools[selectedToggleIndex] = true;

    return ToggleButtons(
      isSelected: userChoiceBools,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      // selectedBorderColor: Colors.red[700],
      // selectedColor: Colors.white,
      // fillColor: Colors.red[200],
      // color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      onPressed: (int index) {
        ref.read(selectedToggleIndexProvider.notifier).state = index;
      },
      children: const [Text('Music'), Text('Users')],
    );
  }
}
