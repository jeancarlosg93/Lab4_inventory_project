import 'package:firebase_auth/firebase_auth.dart';

class authService {
  //register email/password
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      print(user.toString());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in email/password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      print(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}