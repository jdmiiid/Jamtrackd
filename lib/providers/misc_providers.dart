import 'package:hooks_riverpod/hooks_riverpod.dart';

// CurrentDropdownProvider
final currentDropdownProvider = StateProvider<double>((ref) => 0.0);

// TrackListDropdownProvider
final trackListDropdownProvider =
    AutoDisposeStateProvider<String>((ref) => '-');

// AppBarNotifier
final appBarProvider = StateProvider<bool>((ref) => true);

// NavBarNotifier
final navBarProvider = StateProvider<bool>((ref) => false);

//ThemeProvider
final themeProvider = StateProvider<bool>((ref) => true);

// ExpansionNotifier
final expansionProvider = StateProvider<bool>((ref) => true);

final selectedToggleIndexProvider = StateProvider<int>((ref) => 0);

final showSortsProvider = StateProvider<bool>((ref) => false);

final addToStatColumn = StateProvider<int>((ref) => 0);

final postFetchedProvider = StateProvider<bool>((ref) => false);
