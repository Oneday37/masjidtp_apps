import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/admin/edit_keuangan_page.dart';
import 'package:penulisan_ilmiah_application/services/firebase/auth_service.dart';
import 'edit_jadwal_page.dart';
import 'option_kegiatan_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

            //Menu Kontrol Kegiatan Masjid
            listMenu(Icons.event_note, "Kegiatan Masjid",
                const OptionKegiatanPage()),
            const Divider(
              color: Colors.black,
            ),

            //Menu Kontrol Keuangan Masjid
            listMenu(Icons.wallet, "Keuangan Masjid", const EditKeuanganPage()),
            const Divider(
              color: Colors.black,
            ),

            //Menu Kontrol Jadwal Jum'at
            listMenu(
                Icons.calendar_today, "Jadwal Jum'at", const EditJadwalPage()),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),

            //Menu Keluar Dari Akun
            TextButton.icon(
                label: Text(
                  "Logout",
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
                icon: const Icon(Icons.logout_rounded),
                onPressed: () async {
                  await AuthService().signUserOut();
                })
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
