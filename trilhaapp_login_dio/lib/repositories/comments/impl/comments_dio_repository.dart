import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custom_dio.dart';

class CommentDioRespository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    JsonPlaceHolderCustomDio jsonPlaceHolderCustomDio =
        JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustomDio.dio.get('/posts/$postId/comments');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
