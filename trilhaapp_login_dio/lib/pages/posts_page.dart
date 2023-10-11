import 'package:flutter/material.dart';
import 'package:trilhaapp/model/posts_model.dart';
import 'package:trilhaapp/pages/comments_page.dart';
import 'package:trilhaapp/repositories/posts/impl/posts_dio_repository.dart';
import 'package:trilhaapp/repositories/posts/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostsRespository postRepository = PostsDioRepository();
  List<PostsModel> postsModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    postsModel = await postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: postsModel.length,
        itemBuilder: (_, index) {
          var post = postsModel[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CommentsPage(
                            postId: post.id,
                          )));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Card(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          post.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        post.body,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
