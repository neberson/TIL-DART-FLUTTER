import 'dart:convert';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/repositories/comments/comments_repository.dart';

class CommentHttpRespository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
