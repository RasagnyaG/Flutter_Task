import 'package:flutter/material.dart';
import 'package:flutter_task/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register(this.toggleView);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text("Sign Up"),
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
                        hintText: "Password",
                      ),
                      validator : (val) => val!.length < 6 ? "Your password should contain at least 6 characters" : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 50),
                    FlatButton(
                      color: Colors.white60,
                      padding: EdgeInsets.all(15),
                      child: Text("Sign Up with Email"),
                      onPressed:  () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.signUpEmail(email, password);
                          if (result == null) {
                            setState(() => error = "Please enter a valid Email");
                          }
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    FlatButton(
                      padding: EdgeInsets.all(15),
                      color: Colors.grey,
                      child: Text("Sign In"),
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
