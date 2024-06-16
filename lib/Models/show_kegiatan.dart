import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataKegiatan extends StatelessWidget {
  String tanggalKegiatan;
  String namaKegiatan;
  String deskripsi;
  dynamic dokumentasi;

  ShowDataKegiatan(
      {required this.tanggalKegiatan,
      required this.namaKegiatan,
      required this.deskripsi,
      required this.dokumentasi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.event_note),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Kegiatan Masjid",
                style: GoogleFonts.oswald(fontSize: 18),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              ListTile(
                  title:
                      Text("Event 1", style: GoogleFonts.roboto(fontSize: 18)),
                  subtitle: Text("Deskripsi",
                      style: GoogleFonts.roboto(fontSize: 18)),
                  trailing: Text("Tanggal",
                      style:
                          GoogleFonts.oswald(fontSize: 18, color: Colors.grey)))
            ],
          )
        ],
      ),
    );
  }
}
