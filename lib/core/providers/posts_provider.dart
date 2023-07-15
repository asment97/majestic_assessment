import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/models/post.dart';
import 'package:majestic_assessment/core/repositories/posts_repository.dart';

final postsProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async {
    return await ref.watch(postsRepositoryProvider).fetchPosts();
  },
);
