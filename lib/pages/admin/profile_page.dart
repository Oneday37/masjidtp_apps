import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/admin/edit_keuangan_page.dart';
import 'edit_jadwal_page.dart';
import 'option_kegiatan_page.dart';

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
            listMenu(
                Icons.event_note, "Kegiatan Masjid", const EditKegiatanPage()),
            const Divider(
              color: Colors.black,
            ),
            listMenu(Icons.wallet, "Keuangan Masjid", const EditKeuanganPage()),
            const Divider(
              color: Colors.black,
            ),
            listMenu(
                Icons.calendar_today, "Jadwal Jum'at", const EditJadwalPage())
          ],
        ),
      ),
    );
  }

  ListTile listMenu(icon, String menu, direction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        menu,
        style: GoogleFonts.roboto(fontSize: 18),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
        size: 30,
      ),
      dense: true,
      onTap: () {
        Get.to(direction);
      },
    );
  }
}
