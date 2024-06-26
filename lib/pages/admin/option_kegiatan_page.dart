import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/admin/option_edit_kegiatan_page.dart';
import 'tambah_kegiatan_page.dart';

class OptionKegiatanPage extends StatefulWidget {
  const OptionKegiatanPage({super.key});

  @override
  State<OptionKegiatanPage> createState() => _OptionKegiatanPageState();
}

class _OptionKegiatanPageState extends State<OptionKegiatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kegiatan Masjid", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Menu Edit Kegiatan Masjid
          listItem("Edit Kegiatan Masjid", const OptionEditPage()),
          const SizedBox(height: 5),

          // Menu Tambah Kegiatan Masjid
          listItem("Tambah Kegiatan Masjid", const TambahKegiatanPage())
        ],
      ),
    );
  }

  listItem(String detail, direction) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        child: SizedBox(
          height: 70,
          child: Card(
            elevation: 5,
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
          ),
        ),
        onTap: () {
          Get.to(direction);
        },
      ),
    );
  }
}
