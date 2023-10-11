import 'dart:convert';
import 'package:trilhaapp/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostsModel>> getPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List)
          .map((post) => PostsModel.fromJson(post))
          .toList();
    }

    return [];
  }
}
