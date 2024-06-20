import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/home_page_jamaah.dart';
import 'package:penulisan_ilmiah_application/services/firebase/auth_gate.dart';
import 'package:penulisan_ilmiah_application/widgets/loading_page.dart';
import '../bloc/masjidtp_bloc.dart';

class LoginVerif extends StatelessWidget {
  const LoginVerif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MasjidtpBloc, MasjidtpState>(
        builder: (context, state) {
          if (state is MasjidtpLoading) {
            return const LoadingPage();
          }
          if (state is MasjidtpLoaded) {
            return Column(
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
                  style: GoogleFonts.oswald(fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "ADMIN",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  onTap: () {
                    Get.to(const AuthGate());
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "JAMA'AH",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                  onTap: () {
                    Get.to(const HomePageJamaah());
                  },
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
