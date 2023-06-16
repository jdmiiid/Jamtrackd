import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/debouncer.dart';

import '../providers/musicbrainz_providers.dart';

class ArtSearcher extends HookConsumerWidget {
  ArtSearcher({super.key});

  static String userQuery = '';
  final _debouncer = Debouncer(milliseconds: 750);

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
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
        cursorColor: const Color(0xff7e483a),
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  ref.read(userSearchProvider.notifier).state = '';
                  clearText();
                },
                icon: const Icon(Icons.clear)),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            hintText: 'Artist name here...'),
      ),
    );
  }
}
