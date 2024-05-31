import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class JadwalSholat extends StatefulWidget {
  const JadwalSholat({super.key});

  @override
  State<JadwalSholat> createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  @override
  Widget build(BuildContext context) {
    final coordinates = Coordinates(-6.3142194, 106.6541554);
    final params = CalculationMethod.singapore.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(coordinates, params);
    return Scaffold(
      body: TimerBuilder.periodic(
        const Duration(minutes: 1),
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  HijriCalendar.now().toFormat("dd MMMM yyyy"),
                  style: GoogleFonts.openSansCondensed(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
                  style: GoogleFonts.oswald(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/masjid.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    //LOKASI
                    Positioned(
                      bottom: 5,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Text(
                                "Cimanggis",
                                style: GoogleFonts.oswald(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black)),
                              ),
                              Text("Cimanggis",
                                  style: GoogleFonts.oswald(
                                      color: Colors.white, fontSize: 25))
                            ],
                          ),
                          Stack(
                            children: [
                              Text("Kota Depok, Indonesia",
                                  style: GoogleFonts.oswald(
                                      textStyle: TextStyle(
                                          fontSize: 25,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 5
                                            ..color = Colors.black))),
                              Text(
                                "Kota Depok, Indonesia",
                                style: GoogleFonts.oswald(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    //JAM

                    Positioned(
                      right: 10,
                      child: Stack(
                        children: [
                          Text(DateFormat.Hm().format(DateTime.now()),
                              style: GoogleFonts.oswald(
                                  textStyle: TextStyle(
                                      fontSize: 50,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                        ..color = Colors.black))),
                          Text(
                            DateFormat.Hm().format(DateTime.now()),
                            style: GoogleFonts.oswald(
                                color: Colors.white, fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shubuh",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        Text(DateFormat.Hm().format(prayerTimes.fajr),
                            style: GoogleFonts.roboto(fontSize: 20)),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dhuhr",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        Text(DateFormat.Hm().format(prayerTimes.dhuhr),
                            style: GoogleFonts.roboto(fontSize: 20)),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Asr",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        Text(DateFormat.Hm().format(prayerTimes.asr),
                            style: GoogleFonts.roboto(fontSize: 20)),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maghrib",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        Text(DateFormat.Hm().format(prayerTimes.maghrib),
                            style: GoogleFonts.roboto(fontSize: 20)),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Isya",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        Text(DateFormat.Hm().format(prayerTimes.isha),
                            style: GoogleFonts.roboto(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
