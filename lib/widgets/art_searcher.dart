import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/debouncer.dart';
import '../providers/spotify_providers.dart';

class ArtSearcher extends HookConsumerWidget {
  ArtSearcher({Key? key}) : super(key: key);

  static String userQuery = '';
  final _debouncer = Debouncer(milliseconds: 750);
  final fieldText = TextEditingController();
  final isFocusedProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: _getThemedInputDecoration(context),
      child: Material(
        elevation: 3.0,
        child: _buildSearchField(context, ref),
      ),
    );
  }

  ThemeData _getThemedInputDecoration(BuildContext context) {
    final currentTheme = Theme.of(context);
    return currentTheme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: currentTheme.colorScheme.onSurface),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, WidgetRef ref) {
    final isFocused = ref.watch(isFocusedProvider);
    final isFocusedNotifier = ref.watch(isFocusedProvider.notifier);

    return TextFormField(
      onTap: () {
        if (!isFocused) {
          isFocusedNotifier.state = true;
        }
      },
      onTapOutside: (outsideTap) {
        if (isFocused) {
          FocusScope.of(context).unfocus();
          isFocusedNotifier.state = false;
        }
      },
      onChanged: (text) {
        _debouncer.run(() {
          userQuery = text;
          ref.watch(userSearchProvider.notifier).state = userQuery;
        });
      },
      controller: fieldText,
      autofocus: true,
      textAlignVertical: TextAlignVertical.center,
      decoration: _buildInputDecoration(isFocused, ref, context),
    );
  }

  InputDecoration _buildInputDecoration(
      bool isFocused, WidgetRef ref, BuildContext context) {
    final isFocusedNotifier = ref.watch(isFocusedProvider.notifier);
    return InputDecoration(
      prefixIcon: isFocused
          ? GestureDetector(
              child: Icon(Icons.clear),
              onTap: () {
                if (ref.watch(userSearchProvider).isNotEmpty) {
                  clearText();
                  ref.watch(userSearchProvider.notifier).state = '';
                } else {
                  FocusScope.of(context).unfocus();
                  isFocusedNotifier.state = false;
                }
              },
            )
          : GestureDetector(
              child: Icon(Icons.search),
              onTap: () => print(isFocused),
            ),
      hintText: 'Artist name here...',
    );
  }

  void clearText() => fieldText.clear();
}
