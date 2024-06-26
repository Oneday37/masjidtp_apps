import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:penulisan_ilmiah_application/widgets/kegiatan_masjid.dart';
import 'package:penulisan_ilmiah_application/widgets/finance.dart';
import 'package:penulisan_ilmiah_application/widgets/kutipan_hadis.dart';
import 'package:penulisan_ilmiah_application/widgets/jadwal_jumat.dart';
import '../jadwal_sholat_page.dart';
import '../quran/quran_page.dart';
import 'profile_page.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListView(
        children: [
          //Sistem penanggalan islam / Kalender hijriah
          Text(
            HijriCalendar.now().toFormat("dd MMMM yyyy"),
            style: GoogleFonts.openSansCondensed(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          //Sistem penanggalan global
          Text(
            DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
            style:
                GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Finance(),
          ),
          const HadisHarian(),
          const SizedBox(
            height: 15,
          ),
          const JadwalJumat(),
          const SizedBox(
            height: 15,
          ),
          const EventSection()
        ],
      ),
    ),
    const JadwalSholat(),
    const QuranPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GNav(
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: const Color.fromRGBO(67, 160, 71, 1),
              tabBorderRadius: 15,
              iconSize: 20,
              gap: 8,
              padding: const EdgeInsets.all(10),
              tabs: [
                GButton(
                  icon: Icons.home_rounded,
                  text: "Beranda",
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                GButton(
                  icon: FlutterIslamicIcons.solidPrayingPerson,
                  text: "Jadwal",
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                GButton(
                  icon: FlutterIslamicIcons.solidQuran2,
                  text: "Qur'an",
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: "Akun",
                  textStyle: GoogleFonts.robotoCondensed(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
