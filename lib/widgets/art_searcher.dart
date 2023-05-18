import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/main.dart';
import 'package:tasktrack/models/debouncer.dart';

import '../providers/musicbrainz_providers.dart';

class ArtSearcher extends HookConsumerWidget {
  ArtSearcher({super.key});

  static String userQuery = '';
  final _debouncer = Debouncer(milliseconds: 750);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: (text) {
        _debouncer.run(() {
          userQuery = text;
          ref.read(userSearchProvider.notifier).state = userQuery;
        });
      },
      cursorColor: const Color(0xff7e483a),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Color(0xff7e483a),
          hintStyle: TextStyle(color: Color(0xff7e483a)),
          filled: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff7e483a)),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff7e483a))),
          fillColor: Colors.white,
          hintText: 'Please enter an album'),
    );
  }
}
