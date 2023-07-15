import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/constants/custom_colors.dart';
import 'package:majestic_assessment/core/models/post.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      dense: true,
      isThreeLine: true,
      horizontalTitleGap: 10,
      leading: const Icon(
        Icons.book_rounded,
        size: 30,
        color: CustomColors.secondaryColor,
      ),
      tileColor: Colors.white,
      title: Text(
        post.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        post.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
