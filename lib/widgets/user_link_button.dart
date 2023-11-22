import 'package:Jamtrackd/models/special_user_data.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserLinkButton extends ConsumerWidget {
  const UserLinkButton({super.key, required this.user});

  final SpecialUserData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage:
              user.photoURL == null
                ? const AssetImage('assets/images/no_profile_pic.jpeg')
                  as ImageProvider<Object>?
                : CachedNetworkImageProvider(user.photoURL!)
          ),
          const SizedBox(
            width: 10
          ),
          Text(
            user.username,
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).colorScheme.primary
            ),
          )
        ],
      ),
    );
  }
}