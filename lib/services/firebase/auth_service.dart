import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Instansi Firebase Authentication
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Get user
  User? getUser() {
    return firebaseAuth.currentUser;
  }

  //Login Method
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //Catch Error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Logout Method
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
