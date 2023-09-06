import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_firestore_providers.dart';

class CurrentDropdownProvider extends StateNotifier<double> {
  CurrentDropdownProvider() : super(0.0);

  void changeInt(double selectedNum) {
    state = selectedNum;
  }
}

final ratingDropdownSelectedDouble =
    StateNotifierProvider.autoDispose<CurrentDropdownProvider, double>(
        (ref) => CurrentDropdownProvider());

// separate these

class TrackListDropdownProvider extends StateNotifier<String> {
  TrackListDropdownProvider() : super('-');

  void changeTrack(String selectedTrack) {
    state = selectedTrack;
  }
}

final trackDropdownSelectedDouble =
    StateNotifierProvider.autoDispose<TrackListDropdownProvider, String>(
        (ref) => TrackListDropdownProvider());

// more separation

class AppBarNotifier extends StateNotifier<bool> {
  AppBarNotifier() : super(true);

  void changeBool() {
    state = state ? false : true;
  }
}

final stateNotifierAppBar = StateNotifierProvider((ref) => AppBarNotifier());

class NavBarNotifier extends StateNotifier<bool> {
  NavBarNotifier() : super(false);

  void changeBool() {
    state = state ? false : true;
  }
}

final stateNotifierNavBar = StateNotifierProvider((ref) => NavBarNotifier());

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(true);

  // true, if dark
  // false, if light

  void changeBool() {
    state = state ? false : true;
  }
}

final stateNotifierTheme = StateNotifierProvider((ref) => ThemeNotifier());

class ExpansionNotifier extends StateNotifier<bool> {
  ExpansionNotifier() : super(true);

  // true, if closed
  // false, if open

  void changeBool() {
    state = state ? false : true;
  }
}

final stateNotifierExpansion =
    StateNotifierProvider((ref) => ExpansionNotifier());
