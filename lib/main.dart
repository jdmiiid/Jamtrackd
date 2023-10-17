import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/themes.dart';
import 'package:tasktrack/providers/go_router_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasktrack/providers/misc_providers.dart';
import 'package:tasktrack/services/firebase_auth/our_provider_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');
  runApp(
      ProviderScope(observers: [OurProviderObserver()], child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter goRouter = ref.watch(goRouterProvider);

    final themeProvider = ref.watch(stateNotifierTheme) as bool;

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: MaterialApp.router(
        routerConfig: goRouter,
        title: 'Setlist',
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider ? ThemeMode.dark : ThemeMode.light,
        theme: MyThemes.colorSchemedThemeData(
            // mode: MediaQuery.of(context).platformBrightness,
            isDarkMode: themeProvider),
      ),
    );
  }
}
