import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasktrack/pages/album_rating_page.dart';
import 'package:tasktrack/pages/albums_page.dart';
import 'package:tasktrack/pages/login_page.dart';
import '../main.dart';
import '../pages/albums_list_page.dart';
import '../pages/feed_page.dart';
import '../pages/search_page.dart';
import '../widgets/app_and_bottom_nav.dart';
import 'firebase_auth_providers.dart';

// 2. add a part file
part 'go_router_providers.g.dart';

// 3. update the declaration and use the @riverpod annotation

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/login_page',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithAppAndBottomNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: ref.watch(firebaseAuthCurrentUserProvider) == null
                    ? const LoginPage()
                    : const HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                transitionDuration: const Duration(milliseconds: 500),
              ),
            ),
            GoRoute(
              path: '/feed_page',
              builder: (context, state) => const FeedPage(),
            ),
            GoRoute(
              path: '/albums_page',
              builder: (context, state) => const AlbumsPage(),
            ),
            GoRoute(
              path: '/rating_page',
              name: 'coolrankings',
              builder: (context, state) => AlbumRatingPage(
                albumName: state.queryParameters['discName'],
                albumUrl: state.queryParameters['discUrl'],
                artistName: state.queryParameters['discArtist'],
              ),
            ),
            GoRoute(
              path: '/search_page',
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: const SearchPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                transitionDuration: const Duration(milliseconds: 500),
              ),
            ),
            GoRoute(
              path: '/albums_search',
              name: 'sample',
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: AlbumsListPage(
                  index: state.queryParameters['currentInd'],
                  query: state.queryParameters['name'],
                  id: state.queryParameters['mbid'],
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                transitionDuration: const Duration(milliseconds: 500),
              ),
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/login_page',
          builder: (context, state) => const LoginPage(),
        ),
      ]);
}
