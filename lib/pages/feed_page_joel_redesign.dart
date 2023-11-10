import 'package:Jamtrackd/providers/firebase_firestore_providers.dart';
import 'package:Jamtrackd/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:Jamtrackd/widgets/root_app_bar.dart';

class JoelFeedPage extends ConsumerStatefulWidget {
  const JoelFeedPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JoelFeedPageState();
}

// class JoelFeedPage extends StatelessWidget {
//   const JoelFeedPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // No-async scaffold for testing
//     return Scaffold(
//       body: emptyFeed()
//     );
//   }
// }

class _JoelFeedPageState extends ConsumerState<JoelFeedPage> {
  final ScrollController _scrollController = ScrollController();
  final int initialPostsLimit = 3;
  final int followUpPostsLimit = 2;

  Future<void> fetchPostsFuture(List<String> followingList) {
    return ref
      .read(stateNotifierPostList.notifier)
      .fetchInitialPosts(initialPostsLimit, ref, followingList);
  }

  @override
  void initState() {
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<String>> followingListAsync = 
      ref.watch(retrieveFollowingListStreamProvider);

    return followingListAsync.when(
      data: (followingList) {
        return Scaffold(
          appBar: RootNavAppBar(
            title: const Text('Jamtrackd'),
            appBar: AppBar(),
            ref: ref
          ),
          body: FutureBuilder(
            future: fetchPostsFuture(followingList),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Text('Loading');
              }
              
              return Consumer(builder: (context, ref, _) {
                final updatedPosts = ref.watch(stateNotifierPostList);

                return updatedPosts.isEmpty
                  ? emptyFeed()
                  : RefreshIndicator(
                    onRefresh: () async {
                      await fetchPostsFuture(followingList);
                    },
                    child: NotificationListener<ScrollNotification>(
                      // Wrap the ListView with NotificationListener
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                          _scrollController.position.maxScrollExtent -
                          _scrollController.offset == 0
                        ) {
                          ref
                            .watch(stateNotifierPostList.notifier)
                            .fetchFollowUpPosts(
                              followUpPostsLimit, ref, followingList
                            );
                        }
                        return false;
                      },
                      child: ListView.separated(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: updatedPosts.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < updatedPosts.length) {
                            return GestureDetector(
                              child: const Text('Gabagu'),
                            );
                          } else {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.only(top: 8),
                                child: const Text('You reached the bottom!')
                              )
                            );
                          }
                        },
                        separatorBuilder: (context, index) => Divider(
                          thickness: 2,
                          color: Theme.of(context).colorScheme.primary,
                          height: 2
                        )
                      )
                    )
                  );
                });
              }
          ),
          bottomNavigationBar: BottomNavBar()
        );
      },
      error: (Object error, StackTrace stackTrace) => 
        Text('Error within followingList Feedpage: $error'),
        loading: () => const Center(child: CircularProgressIndicator())
    ); // followingListAsync.when()
  }

  Widget emptyFeed() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your feed is empty.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Text(
                  "Add some friends",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline
                  )
                )
              ),
              const Text(" to see what they're reviewing!"),
            ]
          )
        ]
      )
    );
  }
}
