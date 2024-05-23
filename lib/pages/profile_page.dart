import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 70,
            ),
            radius: 50,
          ),
          Text(
            "A D M I N",
            style: GoogleFonts.oswald(fontSize: 30),
          ),
          ListTile(
            leading: const Icon(
              Icons.event_note,
              size: 25,
            ),
            title: Text(
              "Kegiatan",
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 30,
            ),
            dense: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.wallet,
              size: 25,
            ),
            title: Text(
              "Keuangan",
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 30,
            ),
            dense: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
