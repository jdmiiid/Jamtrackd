import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class RatingBubble extends ConsumerWidget {
  const RatingBubble(this.rating, this.color, {super.key});

  final String rating;
  final Color color;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(3.5),
          child: Text(
            rating,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}