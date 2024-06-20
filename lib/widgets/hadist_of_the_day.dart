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
  late Stream<DateTime> _dateStream;
  void initState() {
    super.initState();
    _dateStream = _generateDailyStream();
  }

  Stream<DateTime> _generateDailyStream() async* {
    while (true) {
      DateTime now = DateTime.now();
      DateTime nextMidnight =
          DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);
      Duration timeUntilNextMidnight = nextMidnight.difference(now);

      await Future.delayed(timeUntilNextMidnight);
      yield DateTime.now();
    }
  }

  Hadis getRandomHadis() {
    return hadis[Random().nextInt(hadis.length)];
  }

  @override
  Widget build(BuildContext context) {
    Hadis getHadis = getRandomHadis();
    return StreamBuilder(
        stream: _dateStream,
        builder: (context, snapshot) {
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
                  Text("Hadis Harian",
                      style: GoogleFonts.oswald(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(getHadis.arabic,
                      style: GoogleFonts.roboto(fontSize: 20),
                      textAlign: TextAlign.center),
                  Text(
                    getHadis.indonesia,
                    style: GoogleFonts.roboto(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    getHadis.perawi,
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        });
  }
}
