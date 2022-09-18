import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/models/post.dart';
import 'package:provider/provider.dart';

class DBSecvice {
  final String? uid ;
  DBSecvice({this.uid});
  final CollectionReference collection = FirebaseFirestore.instance.collection('posts');

  Future userData(String title, String image, String description) async {
    return collection.doc(uid).set({
      'title' : title,
      'image' : image,
      'description' : description
    });
  }

  List<Post> _creatingList (QuerySnapshot snap){
    return snap.docs.map((doc) {
      var da = doc.data as Map;
      return Post(
        title: da['title'] ?? 'Title',
        image: da['image'] ?? '',
        description: da['description'] ?? 'Description',
      );
    }).toList();
  }

  Stream<List<Post>> get posts {
    return collection.snapshots().map(_creatingList);
  }

}