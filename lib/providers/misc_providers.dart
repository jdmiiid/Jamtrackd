import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
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
