import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/network/dio_client.dart';

final postsApiProvider = Provider<PostsApi>((ref) => PostsApi(ref));

class PostsApi {
  final Ref ref;
  PostsApi(this.ref);

  Future<Response> fetchPosts() async {
    try {
      final Response response = await ref.read(dioClientProvider).get(
            "/posts",
          );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
