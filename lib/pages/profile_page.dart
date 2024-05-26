import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_jadwal_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "A D M I N",
              style: GoogleFonts.oswald(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.event_note,
                size: 25,
              ),
              title: Text(
                "Kegiatan Masjid",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.balance,
                size: 25,
              ),
              title: Text(
                "Keuangan Masjid",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today,
                size: 25,
              ),
              title: Text(
                "Jadwal Jum'at",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
              dense: true,
              onTap: () {
                Get.to(EditJadwalPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
