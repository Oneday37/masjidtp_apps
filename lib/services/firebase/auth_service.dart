import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // //Instansi firebase auth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Get user
  User? getUser() {
    return firebaseAuth.currentUser;
  }

  //login or sing in method
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    //login or sing in
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
