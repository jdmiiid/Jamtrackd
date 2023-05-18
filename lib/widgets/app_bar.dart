import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/pages/albums_page.dart';
import 'package:tasktrack/providers/musicbrainz_providers.dart';
import 'package:tasktrack/widgets/see_tab_bar.dart';

import '../models/artist.dart';
import '../models/debouncer.dart';
import '../providers/futures.dart';

class MyAppBar extends HookConsumerWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: const Color(0xff3f704d),
      title: const Text(
        'øbiñyu',
        style: TextStyle(letterSpacing: 10, fontSize: 30),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }
}
