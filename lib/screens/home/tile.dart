import 'package:flutter/material.dart';
import 'package:flutter_task/models/post.dart';
class Tile extends StatelessWidget {
  final Post post;
  Tile({required this.post});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(post.title,
            style: TextStyle(
              color: Colors.black54
            )),
            if (post.image != '') Image.network(post.image!),
            Text(post.description,
              style: TextStyle(
                  color: Colors.black54
              ))
          ],
        ),
      ),

    );
  }
}
