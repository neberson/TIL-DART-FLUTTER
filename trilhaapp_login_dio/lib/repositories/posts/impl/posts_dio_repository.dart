import 'package:trilhaapp/model/posts_model.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custom_dio.dart';
import 'package:trilhaapp/repositories/posts/posts_repository.dart';

class PostsDioRepository implements PostsRespository {
  @override
  Future<List<PostsModel>> getPosts() async {
    JsonPlaceHolderCustomDio jsonPlaceHolderCustomDio =
        JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio
        .get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) => PostsModel.fromJson(post))
          .toList();
    }
    return [];
  }
}
