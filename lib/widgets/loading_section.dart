import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              "assets/tp1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "MASJID TAMAN PUSPA",
            style: GoogleFonts.oswald(fontSize: 28),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
