import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:penulisan_ilmiah_application/pages/login_page.dart';
import 'package:penulisan_ilmiah_application/pages/admin/home_page_admin.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //Jika admin belum logout
              return const HomePageAdmin();
            } else {
              //Jika admin telah logout
              return const LoginPage();
            }
          }),
    );
  }
}
