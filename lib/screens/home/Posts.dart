import 'package:flutter/material.dart';
import 'package:flutter_task/models/post.dart';
import 'package:flutter_task/screens/home/tile.dart';
import 'package:provider/provider.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {

    final posts = Provider.of<List<Post>>(context);
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index){
        return Tile(post : posts[index]);
      },
    );
  }
}
