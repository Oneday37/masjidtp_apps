import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penulisan_ilmiah_application/widgets/login_verif.dart';

import 'services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Taman Puspa Apps",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, useMaterial3: true),
      home: const LoginVerif(),
    );
  }
}
