import 'package:flutter/material.dart';
import 'package:flutter_task/screens/authenticate/sign_in.dart';
import 'package:flutter_task/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signin = true;
  void toggleView() {
    setState(() => signin = !signin);
  }

  @override
  Widget build(BuildContext context) {
    if (signin) {
      return SignIn(toggleView);
    }
    else {
      return Register(toggleView);
    }
  }
}


