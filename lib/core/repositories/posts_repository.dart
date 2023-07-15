import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/models/post.dart';
import 'package:majestic_assessment/core/network/apis/posts_api.dart';
import 'package:majestic_assessment/core/network/dio_exception.dart';

final postsRepositoryProvider =
    Provider<PostsRepository>((ref) => PostsRepository(ref));

class PostsRepository {
  final Ref ref;
  PostsRepository(this.ref);

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await ref.read(postsApiProvider).fetchPosts();

      return (response.data as List<dynamic>)
          .map((post) => Post.fromJson(post))
          .toList();
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      log("fetchPosts", error: errorMessage);
      throw errorMessage;
    } catch (e, t) {
      log("fetchPosts", error: e, stackTrace: t);
      rethrow;
    }
  }
}
