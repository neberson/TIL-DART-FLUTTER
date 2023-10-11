import 'package:trilhaapp/model/posts_model.dart';

abstract class PostsRespository {
  Future<List<PostsModel>> getPosts();
}
