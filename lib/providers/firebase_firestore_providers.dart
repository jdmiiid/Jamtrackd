import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/firebase_auth_providers.dart';

import '../models/comment.dart';

import '../models/post.dart';
import '../models/special_user_data.dart';
import 'spotify_providers.dart';

part 'firebase_firestore_providers.g.dart';

final reviewLookProvider = StateProvider<Post?>((ref) => null);

final rLookNeedsSetUpProvider = StateProvider<bool>((ref) => true);

final tappedUserDataProvider = StateProvider<SpecialUserData?>((ref) => null);

final orderCriterionProvider = StateProvider<String>((ref) => 'timestamp');

final upOrDownProvider = StateProvider<bool>((ref) => true);

CollectionReference getUsersCollectionRef() {
  return FirebaseFirestore.instance.collection('users');
}

CollectionReference getPostsCollectionRef() {
  return FirebaseFirestore.instance.collection('posts');
}

// Reusable function to retrieve a user's following list
@riverpod
Stream<List<String>> retrieveFollowingListStream(
    RetrieveFollowingListStreamRef ref) async* {
  final userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;

  final followingCollectionRef =
      getUsersCollectionRef().doc(userID).collection('following');

  yield* followingCollectionRef.snapshots().map((querySnapshot) {
    final followingList = querySnapshot.docs.map((doc) => doc.id).toList();
    followingList.add(userID);
    return followingList;
  });
}

@riverpod
Future<SpecialUserData?> specialUserDataFromUID(
    SpecialUserDataFromUIDRef ref, String? uid) async {
  final varUID = uid ?? ref.watch(firebaseAuthCurrentUserProvider)!.uid;

  final firebaseQuery = getUsersCollectionRef().doc(varUID);

  final specialUser = await firebaseQuery
      .withConverter(
          fromFirestore: SpecialUserData.fromFirestore,
          toFirestore: SpecialUserData.toFirestore)
      .get();

  return specialUser.data();
}

// Unique User Sorting Algo
@riverpod
Future<List<SpecialUserData?>> queriedUserSearch(QueriedUserSearchRef ref,
    {int userLimit = 10}) async {
  final String searchQuery = ref.watch(userSearchProvider);

  final List<SpecialUserData?> listOfSpecialUsers = [];

  final displayNameQuery = getUsersCollectionRef()
      .where('displayName', isGreaterThanOrEqualTo: searchQuery)
      .limit((userLimit / 2).floor())
      .withConverter(
          fromFirestore: SpecialUserData.fromFirestore,
          toFirestore: SpecialUserData.toFirestore)
      .get();

  final usernameQuery = getUsersCollectionRef()
      .where('username', isGreaterThanOrEqualTo: searchQuery)
      .limit((userLimit / 2).floor())
      .withConverter(
          fromFirestore: SpecialUserData.fromFirestore,
          toFirestore: SpecialUserData.toFirestore)
      .get();

  final results = await Future.wait([displayNameQuery, usernameQuery]);

  listOfSpecialUsers.addAll(collectSpecialUsersFromResults(results));
  listOfSpecialUsers.sort((a, b) {
    return calculateRelevanceScore(b, searchQuery)
        .compareTo(calculateRelevanceScore(a, searchQuery));
  });

  return listOfSpecialUsers.take(userLimit).toList();
}

List<SpecialUserData?> collectSpecialUsersFromResults(
    List<QuerySnapshot> results) {
  final listOfSpecialUsers = <SpecialUserData?>[];
  for (final querySnapshot in results) {
    listOfSpecialUsers.addAll(
        querySnapshot.docs.map((doc) => doc.data() as SpecialUserData?));
  }
  return listOfSpecialUsers;
}

double calculateRelevanceScore(SpecialUserData? user, String searchQuery) {
  if (user == null) {
    return 0.0;
  }

  final searchSet = Set<String>.from(searchQuery.split(' '));
  final displayNameSet = Set<String>.from(user.displayName?.split(' ') ?? []);
  final usernameSet = Set<String>.from(user.username!.split(' '));

  final displayNameScore = calculateJaccardIndex(searchSet, displayNameSet);
  final usernameScore = calculateJaccardIndex(searchSet, usernameSet);

  final weightedScore = displayNameScore * 0.7 + usernameScore * 0.3;

  return weightedScore;
}

double calculateJaccardIndex(Set<String> set1, Set<String> set2) {
  final intersection = set1.intersection(set2).length;
  final union = set1.union(set2).length;

  return (intersection / union) * intersection;
}
// Part of the User Sorting Algo

@riverpod
Future<List<String>> retrieveFollowingListByIDFuture(
    RetrieveFollowingListByIDFutureRef ref, String tappedUserID) async {
  final followingCollectionRef =
      getUsersCollectionRef().doc(tappedUserID).collection('following');

  final QuerySnapshot querySnapshot = await followingCollectionRef.get();

  final List<String> followingList =
      querySnapshot.docs.map((doc) => doc.id).toList();

  return followingList;
}

@riverpod
Future<List<String>> retrieveFollowerListByIDFuture(
    RetrieveFollowerListByIDFutureRef ref, String tappedUserID) async {
  final followerCollectionRef =
      getUsersCollectionRef().doc(tappedUserID).collection('followers');

  final QuerySnapshot querySnapshot = await followerCollectionRef.get();

  final List<String> followerList =
      querySnapshot.docs.map((doc) => doc.id).toList();

  return followerList;
}

// Reusable function to retrieve comments based on a query
Future<List<Comment>> retrieveCommentList(Query<Comment> query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}

// Reusable function to retrieve comments based on a query
Future<List<String>> retrieveCommentLikeList(Query query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.id).toList();
}

@riverpod
FirebaseFirestore firebaseFirestoreInstance(FirebaseFirestoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}

// Reusable function to retrieve posts based on a query
Future<List<Post>> retrievePosts(Query<Post> query) async {
  final querySnapshot = await query.get();
  return querySnapshot.docs.map((doc) => doc.data()).toList();
}

class UpdatedPostsNotifier extends StateNotifier<List<Post>> {
  UpdatedPostsNotifier() : super([]);

  Future<void> fetchFollowUpPosts(
      int limit, WidgetRef ref, List<String> followedUserIds) async {
    final query = getPostsCollectionRef()
        .where('author', whereIn: followedUserIds)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot, _),
          toFirestore: (post, _) => Post.toFirestore(post, _),
        );

    final newPosts =
        await retrievePosts(query.startAfter([state.last.timestamp]));

    if (newPosts.length < limit) {
      ref.read(hasMorePostsProvider.notifier).state = false;
    }

    state = state + newPosts;
  }

  Future<void> fetchInitialPosts(
      int limit, WidgetRef ref, List<String> followedUserIds) async {
    final query = getPostsCollectionRef()
        .where('author', whereIn: followedUserIds)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot, _),
          toFirestore: (post, _) => Post.toFirestore(post, _),
        );

    state = await retrievePosts(query);
  }
}

final stateNotifierPostList =
    StateNotifierProvider<UpdatedPostsNotifier, List<Post>>(
        (ref) => UpdatedPostsNotifier());

final hasMorePostsProvider = StateProvider<bool>((ref) => true);

// For comments

final hasMoreCommentsProvider = StateProvider<bool>((ref) => true);

class UpdatedCommentsNotifier extends StateNotifier<List<Comment>> {
  UpdatedCommentsNotifier() : super([]);

  Future<void> _fetchComments(
    int limit,
    WidgetRef ref,
    String postId, {
    bool isInitial = false,
  }) async {
    final query = getPostsCollectionRef()
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .limit(7)
        .withConverter<Comment>(
          fromFirestore: (snapshot, _) => Comment.fromFirestore(snapshot, _),
          toFirestore: (comment, _) => Comment.toFirestore(comment, _),
        );

    final newComments = isInitial
        ? await retrieveCommentList(query)
        : await retrieveCommentList(query.startAfter([state.last.timestamp]));

    if (newComments.length < limit) {
      ref.read(hasMoreCommentsProvider.notifier).state = false;
    }

    if (isInitial) {
      ref.read(hasMoreCommentsProvider.notifier).state = true;
      state = newComments;
    } else {
      final currentList = state + newComments;
      state = currentList;
    }
  }

  Future<void> fetchComments(
    int limit,
    WidgetRef ref,
    String postId, {
    bool isInitial = false,
  }) async {
    await _fetchComments(limit, ref, postId, isInitial: isInitial);
    if (isInitial) {
      print('initial comments used');
    } else {
      print('more comments used');
    }
  }
}

final stateNotifierCommentsList =
    StateNotifierProvider<UpdatedCommentsNotifier, List<Comment>>(
  (ref) => UpdatedCommentsNotifier(),
);

Future<void> createCommentDoc(
    {required String postId, required Comment newComment}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .withConverter<Comment>(
        fromFirestore: Comment.fromFirestore,
        toFirestore: Comment.toFirestore,
      );
  await firestoreCollection.doc().set(newComment);
}

Future<void> addFirestorePostLike({
  required String userId,
  required String postId,
}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('postLikes')
      .doc(userId);

  await firestoreCollection.set({});
}

Future<void> deleteFirestorePostLike(
    {required String userId, required String postId}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('postLikes')
      .doc(userId);

  await firestoreCollection.delete();
}

Future<void> addFirestoreFollow({
  required String userGetterId,
  required String userGiverId,
}) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  final getterFollowersRef = firestore
      .collection('users')
      .doc(userGetterId)
      .collection('followers')
      .doc(userGiverId);
  final giverFollowingRef = firestore
      .collection('users')
      .doc(userGiverId)
      .collection('following')
      .doc(userGetterId);

  // Must type cast for Firebase to accept
  batch.set(getterFollowersRef, <String, dynamic>{});
  batch.set(giverFollowingRef, <String, dynamic>{});

  try {
    await batch.commit();
  } catch (e) {
    print('Error adding follower: $e');
  }
}

Future<void> deleteFirestoreFollow({
  required String userGetterId,
  required String userGiverId,
}) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  final getterFollowersRef = firestore
      .collection('users')
      .doc(userGetterId)
      .collection('followers')
      .doc(userGiverId);
  final giverFollowingRef = firestore
      .collection('users')
      .doc(userGiverId)
      .collection('following')
      .doc(userGetterId);

  batch.delete(getterFollowersRef);
  batch.delete(giverFollowingRef);

  try {
    await batch.commit();
  } catch (e) {
    print('Error deleting follower: $e');
  }
}

@riverpod
Future<List<String>> fetchCommentLikes(FetchCommentLikesRef ref,
    {required postId, required commentId}) async {
  final query = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .doc(commentId)
      .collection('commentLikes');

  final querySnapshot = await query.get();
  // ref.read(stateNotifierCommentLikeList.notifier).state =
  return querySnapshot.docs.map((doc) => doc.id).toList();
}

Future<void> addFirestoreCommentLike({
  required String userId,
  required String postId,
  required String commentId,
}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .doc(commentId)
      .collection('commentLikes')
      .doc(userId);

  await firestoreCollection.set({});
}

Future<void> deleteFirestoreCommentLike(
    {required String userId,
    required String postId,
    required String commentId}) async {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .doc(commentId)
      .collection('commentLikes')
      .doc(userId);

  await firestoreCollection.delete();
}

@riverpod
Stream<List<Post>> postCollectionStream(PostCollectionStreamRef ref,
    {String tappedUserID = ''}) async* {
  final String orderCriterion = ref.watch(orderCriterionProvider);
  final bool upOrDown = ref.watch(upOrDownProvider);

  // Reference to Firestore collection
  final CollectionReference postsCollection = getPostsCollectionRef();

  // Query for documents where "author" field is equal to currentUserUid
  Query baseQuery = postsCollection.where('author', isEqualTo: tappedUserID);

  // Additional query conditions for "timestamp" and "rating"
  if (orderCriterion == 'timestamp') {
    baseQuery = baseQuery.orderBy('timestamp', descending: upOrDown);
  } else if (orderCriterion == 'rating') {
    baseQuery = baseQuery.orderBy('content.rating', descending: upOrDown);
    // Modify 'yourNestedField' and 'isGreaterThan' condition as needed.
  }

  // Convert documents to a list of Post objects
  final List<Post> posts = await baseQuery
      .withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromFirestore(snapshot, _),
        toFirestore: (post, _) => Post.toFirestore(post, _),
      )
      .get()
      .then((querySnapshot) {
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  });

  // Yield the resulting list of posts
  yield posts;
}
