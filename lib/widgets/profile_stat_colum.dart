import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/providers/firebase_firestore_providers.dart';
import 'package:tasktrack/providers/misc_providers.dart';

class StatelessProfileStatColumn extends ConsumerWidget {
  const StatelessProfileStatColumn({
    required this.itemCount,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  final int itemCount;
  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseProfileStatColumn(
      itemCount: itemCount,
      labelText: labelText,
      additionalItemCount: 0, // No additional items for this column
    );
  }
}

class BaseProfileStatColumn extends StatelessWidget {
  const BaseProfileStatColumn({
    required this.itemCount,
    required this.labelText,
    required this.additionalItemCount,
    Key? key,
  }) : super(key: key);

  final int itemCount;
  final String labelText;
  final int additionalItemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          (itemCount + additionalItemCount).toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class StatelessFollowerColumn extends ConsumerWidget {
  const StatelessFollowerColumn({
    required this.itemCount,
    required this.isCurrentUser,
    Key? key,
  }) : super(key: key);

  final int itemCount;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int toAdd = isCurrentUser ? 0 : ref.watch(addToStatColumn);
    return BaseProfileStatColumn(
      itemCount: itemCount,
      labelText: "Followers",
      additionalItemCount: toAdd, // Additional items for this column
    );
  }
}

class StatelessLongToggleButton extends ConsumerWidget {
  const StatelessLongToggleButton({
    required this.isFollowingProvider,
    required this.tappedUserID,
    Key? key,
  }) : super(key: key);

  final StateProvider<bool> isFollowingProvider;
  final String tappedUserID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollowing = ref.watch(isFollowingProvider);
    final authProvider = ref.watch(firebaseAuthCurrentUserProvider);
    final currentUserId = authProvider!.uid;
    final isCurrentUser = tappedUserID == currentUserId;

    final followButtonLabel = isFollowing ? 'Unfollow' : 'Follow';

    return TextButton(
      onPressed: () {
        if (isCurrentUser) {
          print('sus');
        } else {
          ref.read(isFollowingProvider.notifier).state = !isFollowing;
          ref
              .read(addToStatColumn.notifier)
              .update((state) => isFollowing ? state - 1 : state + 1);

          if (!isFollowing) {
            addFirestoreFollow(
                userGetterId: tappedUserID, userGiverId: currentUserId);
          } else {
            deleteFirestoreFollow(
                userGetterId: tappedUserID, userGiverId: currentUserId);
          }
        }
      },
      style: textButtonStyle(context),
      child: Container(
        decoration: buttonDecoration(context, isFollowing, isCurrentUser),
        alignment: Alignment.center,
        child: Text(
          isCurrentUser ? 'Edit Profile' : followButtonLabel,
          style: buttonTextStyle(context),
        ),
      ),
    );
  }

  ButtonStyle textButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: const Size(0, 0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  BoxDecoration buttonDecoration(
      BuildContext context, bool isFollowing, bool isCurrentUser) {
    return BoxDecoration(
      color: isCurrentUser
          ? Theme.of(context).colorScheme.secondary
          : isFollowing
              ? Colors.white70
              : Theme.of(context).colorScheme.primary,
      border: Border.all(color: Theme.of(context).colorScheme.surface),
      borderRadius: BorderRadius.circular(5),
    );
  }

  TextStyle buttonTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.surface,
      fontWeight: FontWeight.bold,
    );
  }
}
