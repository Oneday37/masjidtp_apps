import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/admin/edit_kegiatan.dart';

import 'tambah_kegiatan.dart';

class EditKegiatanPage extends StatefulWidget {
  const EditKegiatanPage({super.key});

  @override
  State<EditKegiatanPage> createState() => _EditKegiatanPageState();
}

class _EditKegiatanPageState extends State<EditKegiatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kegiatan Masjid", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          listItem("Edit Kegiatan Masjid", const EditPage()),
          // ignore: prefer_const_constructors
          SizedBox(height: 5),
          listItem("Tambah Kegiatan Masjid", const TambahJadwalPage())
        ],
      ),
    );
  }

  listItem(String detail, direction) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 70,
        child: Card(
          elevation: 5,
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detail, style: GoogleFonts.roboto(fontSize: 18)),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
            onTap: () {
              Get.to(direction);
            },
          ),
        ),
      ),
    );
  }
}
