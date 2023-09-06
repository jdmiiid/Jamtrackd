import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/debouncer.dart';

import '../providers/misc_providers.dart';
import '../providers/spotify_providers.dart';

class ArtSearcher extends HookConsumerWidget {
  ArtSearcher({super.key});

  static String userQuery = '';
  final _debouncer = Debouncer(milliseconds: 750);

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  void routeReturn(WidgetRef ref, BuildContext context) {
    ref.read(stateNotifierAppBar.notifier).changeBool();
    context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = Theme.of(context);
    //Gets the Theme, copies the data, but overrides the borders for search bar
    return Theme(
      data: currentTheme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSurface)),
        ),
      ),
      child: Material(
        elevation: 3.0,
        child: TextFormField(
          controller: fieldText,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (text) {
            _debouncer.run(() {
              userQuery = text;
              ref.read(userSearchProvider.notifier).state = userQuery;
            });
          },
          decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  routeReturn(ref, context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  fieldText.text == ''
                      ? routeReturn(ref, context)
                      : ref.read(userSearchProvider.notifier).state = '';
                  clearText();
                },
                icon: const Icon(Icons.clear),
              ),
              hintText: 'Artist name here...'),
        ),
      ),
    );
  }
}
