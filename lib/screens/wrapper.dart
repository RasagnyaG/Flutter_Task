import 'package:flutter/material.dart';
import 'package:flutter_task/screens/home/home.dart';
import 'package:flutter_task/screens/authenticate/authenticate.dart';
import 'package:flutter_task/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final streamResult = Provider.of<User?>(context);

    if (streamResult == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
