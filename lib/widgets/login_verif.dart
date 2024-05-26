import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/Pages/home_page.dart';
import 'package:penulisan_ilmiah_application/Pages/login_page.dart';

class LoginVerif extends StatelessWidget {
  const LoginVerif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Image.asset(
              "assets/tp1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "PILIH AKUN",
            style: GoogleFonts.poppins(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Hero(
            tag: "adminLoginAnimation",
            child: GestureDetector(
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "ADMIN",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  )),
              onTap: () {
                Get.to(const LoginPage());
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    "JAMA'AH",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )),
            onTap: () {
              Get.to(const HomePage());
            },
          ),
        ],
      ),
    );
  }
}
