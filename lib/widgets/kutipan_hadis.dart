import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/models/hadis_model.dart';
import 'package:penulisan_ilmiah_application/models/list_hadis.dart';

class HadisHarian extends StatefulWidget {
  const HadisHarian({super.key});

  @override
  State<HadisHarian> createState() => _HadisHarianState();
}

class _HadisHarianState extends State<HadisHarian> {
  Hadis getRandomHadis() {
    return listHadis[Random().nextInt(listHadis.length)];
  }

  @override
  Widget build(BuildContext context) {
    Hadis getHadis = getRandomHadis();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFFA200), Color(0xFFFFD000)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Kutipan Hadis",
                style: GoogleFonts.oswald(
                    fontSize: 23, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(getHadis.arabic,
                  style: GoogleFonts.amiri(fontSize: 23),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                getHadis.indonesia,
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Text(
              "-${getHadis.perawi}-",
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
