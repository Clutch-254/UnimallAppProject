import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationUser {
  // To store data in firestore cloud
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // For user authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

// For new user sign up
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    String res = "Some error occurred";
    try {
      // For user registration in firebase auth with user and password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Adds user to Unimall cloud firestore
      await _firestore.collection("Users").doc(credential.user!.uid).set({
        "name": name,
        "email": email,
        "uid": credential.user!.uid,
      });
      res = "Success";
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
