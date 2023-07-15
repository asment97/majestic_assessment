import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/posts_provider.dart';
import 'package:majestic_assessment/screens/posts/widgets/post_card.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: posts.when(
        data: (data) {
          return ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(25.0),
            itemBuilder: (context, index) {
              return PostCard(
                post: data[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: data.length,
          );
        },
        loading: () {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        error: (error, stack) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
