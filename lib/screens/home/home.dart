import 'package:flutter/material.dart';
import 'package:flutter_task/models/post.dart';
import 'package:flutter_task/screens/home/Posts.dart';
import 'package:flutter_task/services/auth.dart';
import 'package:flutter_task/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      initialData: [],
      value: DBSecvice().posts,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          elevation: 0,
          title: Text("Home"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Sign Out"),
              onPressed: () async {
                return await _auth.signOut();
              },
            )
          ],
        ),
        body: Posts(),
      ),
    );
  }
}
