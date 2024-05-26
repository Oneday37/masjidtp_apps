import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 254, 160, 45),
              Color.fromARGB(255, 255, 247, 0),
            ],
            transform: GradientRotation(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Quotes Of The Day",
              style: GoogleFonts.oswald(fontSize: 18),
            ),
            const Divider(
              color: Colors.black,
            ),
            Text(
              "لَا يُكَلِّفُ ٱللَّهُ نَفۡسًا إِلَّا وُسۡعَهَاۚ",
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            Text(
              "Allah tidak akan membebani seseorang melainkan sesuai dengan kadar kesanggupannya",
              style: GoogleFonts.roboto(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Text(
              "QS Al-Baqarah: 286",
              style: GoogleFonts.roboto(fontSize: 15),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
