import 'package:Jamtrackd/pages/feed_page_joel_redesign.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 1. Import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/feed_page_joel_redesign.dart';
import '../pages/login_page.dart';
import '../pages/review_page_look.dart';
import '../pages/album_rating_page.dart';
import '../pages/albums_list_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_or_edit_profile.dart';
import '../pages/search_page.dart';
import '../pages/settings_page.dart';
import '../pages/verify_email_page.dart';
import 'firebase_auth_providers.dart';

// 2. Add a part file
part 'go_router_providers.g.dart';

// 3. Update the declaration and use the @riverpod annotation
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          child: ref.watch(firebaseAuthCurrentUserProvider) != null
              ? const VerifyEmailPage()
              // ? const TestPage()
              // ? JoelFeedPage()
              : LoginPage(),
        ),
      ),
      GoRoute(
        path: '/profile_page',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfilePage(),
        ),
      ),
      GoRoute(
        path: '/settings_page',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsPage(),
        ),
      ),
      GoRoute(
        path: '/ratings_page',
        builder: (context, state) => AlbumRatingPage(),
      ),
      GoRoute(
        path: '/review_look_page',
        builder: (context, state) => ReviewPageLook(),
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
        path: '/profile_info_page',
        builder: (context, state) => ProfileInfoPage(),
      ),
    ],
  );
}
