import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future signUpEmail(String email, String password) async{
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      await DBSecvice(uid : user!.uid).userData("Title", "", "Description");
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmail (String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}