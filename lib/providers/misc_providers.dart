import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentDropdownProvider extends StateNotifier<double> {
  CurrentDropdownProvider() : super(0.0);

  void changeInt(double selectedNum) {
    state = selectedNum;
  }
}

final dropdownSelectedDouble =
    StateNotifierProvider.autoDispose<CurrentDropdownProvider, double>(
        (ref) => CurrentDropdownProvider());

final ratingResponseReader = StateProvider((ref) => '');

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
