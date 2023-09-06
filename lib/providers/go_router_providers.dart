import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasktrack/pages/album_rating_page.dart';
import 'package:tasktrack/pages/albums_page.dart';
import 'package:tasktrack/pages/login_page.dart';
import 'package:tasktrack/pages/verify_email_page.dart';
import '../pages/albums_list_page.dart';
import '../pages/settings_page.dart';
import '../pages/register_page.dart';
import '../pages/search_page.dart';
import 'firebase_auth_providers.dart';

// 2. add a part file
part 'go_router_providers.g.dart';

// 3. update the declaration and use the @riverpod annotation
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          child: ref.watch(firebaseAuthCurrentUserProvider) != null
              ? const VerifyEmailPage()
              : LoginPage(),
        ),
      ),
      GoRoute(
        path: '/settings_page',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsPage(),
        ),
      ),
      // GoRoute(
      //   path: '/test_page',
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: SpotifyTestPage(),
      //   ),
      // ),
      GoRoute(
        path: '/albums_page',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AlbumsPage(),
        ),
      ),
      GoRoute(
        path: '/ratings_page',
        builder: (context, state) => AlbumRatingPage(),
      ),
      GoRoute(
        path: '/search_page',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const SearchPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ),
      GoRoute(
        path: '/albums_search',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AlbumsListPage(),
        ),
      ),
      GoRoute(path: '/login_page', builder: (context, state) => LoginPage()),
      GoRoute(
        path: '/register_page',
        builder: (context, state) => RegisterPage(),
      ),
    ],
    refreshListenable:
        ref.watch(firebaseAuthUserChangesStreamProvider.select((user) => null)),
  );
}
