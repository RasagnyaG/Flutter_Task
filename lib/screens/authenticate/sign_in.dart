import 'package:flutter/material.dart';
import 'package:flutter_task/services/auth.dart';
import 'package:flutter_task/screens/authenticate/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn(this.toggleView);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration : InputDecoration(
                      hintText: "Email",
                      ),
                      validator : (val) => val!.isEmpty ? "Enter an Email" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration : InputDecoration(
                        hintText: " Password",
                      ),
                      validator : (val) => val!.isEmpty ? "Enter the password" : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 50),
                    FlatButton(
                      color: Colors.white60,
                      padding: EdgeInsets.all(15),
                      child: Text("Sign In with Email"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.signInEmail(email, password);
                          if (result == null) {
                            setState(() => error = "Invalid credentials");
                          }
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    FlatButton(
                      padding: EdgeInsets.all(15),
                      color: Colors.grey,
                      child: Text("Sign Up"),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 17,
                      ),
                    )
                  ],
                )
            ),
          ],
        ),

      ),
    );
  }
}
