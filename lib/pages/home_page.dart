import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:penulisan_ilmiah_application/widgets/finance.dart';
import 'jadwal_sholat_page.dart';
import 'profile_page.dart';
import 'quran_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListView(
        children: [
          Text(
            HijriCalendar.now().toFormat("dd MMMM yyyy"),
            style: GoogleFonts.openSansCondensed(
                fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
            style:
                GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 15),
          Finance(),
          // StreamBuilder(
          //     stream:
          //         collectionReference.snapshots(includeMetadataChanges: true),
          //     builder: (_, snapshot) {
          //       if (snapshot.hasError) {
          //         return Text("Something Went Wrong");
          //       } else if (snapshot.connectionState ==
          //           ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       }
          //       return SizedBox(
          //         height: 120,
          //         width: double.infinity,
          //         child: ListView(
          //             children: snapshot.data!.docs.map((e) {
          //           return Finance(
          //               sisaKas: (e.data() as dynamic)['sisaKas'].toString(),
          //               pemasukan:
          //                   (e.data() as dynamic)['pemasukan'].toString(),
          //               pengeluaran:
          //                   (e.data() as dynamic)['pengeluaran'].toString());
          //         }).toList()),
          //       );
          //     })
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
              tabBackgroundColor: Colors.green,
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
