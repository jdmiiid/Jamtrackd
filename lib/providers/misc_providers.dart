import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_firestore_providers.dart';

// CurrentDropdownProvider
class CurrentDropdownProvider extends StateNotifier<double> {
  CurrentDropdownProvider() : super(0.0);

  void changeInt(double selectedNum) {
    state = selectedNum;
  }
}

final ratingDropdownSelectedDouble =
    StateNotifierProvider.autoDispose<CurrentDropdownProvider, double>(
  (ref) => CurrentDropdownProvider(),
);

// TrackListDropdownProvider
class TrackListDropdownProvider extends StateNotifier<String> {
  TrackListDropdownProvider() : super('-');

  void changeTrack(String selectedTrack) {
    state = selectedTrack;
  }
}

final trackDropdownSelectedDouble =
    StateNotifierProvider.autoDispose<TrackListDropdownProvider, String>(
  (ref) => TrackListDropdownProvider(),
);

// AppBarNotifier
class AppBarNotifier extends StateNotifier<bool> {
  AppBarNotifier() : super(true);

  void changeBool() {
    state = !state;
  }
}

final stateNotifierAppBar = StateNotifierProvider((ref) => AppBarNotifier());

// NavBarNotifier
class NavBarNotifier extends StateNotifier<bool> {
  NavBarNotifier() : super(false);

  void changeBool() {
    state = !state;
  }
}

final stateNotifierNavBar = StateNotifierProvider((ref) => NavBarNotifier());

// ThemeNotifier
class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(true);

  // true, if dark
  // false, if light

  void changeBool() {
    state = !state;
  }
}

final stateNotifierTheme = StateNotifierProvider((ref) => ThemeNotifier());

// ExpansionNotifier
class ExpansionNotifier extends StateNotifier<bool> {
  ExpansionNotifier() : super(true);

  // true, if closed
  // false, if open

  void changeBool() {
    state = !state;
  }
}

final stateNotifierExpansion =
    StateNotifierProvider((ref) => ExpansionNotifier());

final selectedToggleIndexProvider = StateProvider<int>((ref) => 0);

final showSortsProvider = StateProvider<bool>((ref) => false);

final addToStatColumn = AutoDisposeStateProvider<int>((ref) => 0);
