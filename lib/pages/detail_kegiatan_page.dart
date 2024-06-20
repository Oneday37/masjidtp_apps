import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailKegiatanPage extends StatelessWidget {
  DocumentSnapshot getData;
  DetailKegiatanPage({Key? key, required this.getData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getData['namaKegiatan'],
          style: GoogleFonts.oswald(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.network(
            getData['dokumentasiKegiatan'],
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text("Dipublish tanggal: ${getData['tanggalKegiatan']}",
                style: GoogleFonts.openSansCondensed(
                    fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              getData['deskripsiKegiatan'],
              style: GoogleFonts.roboto(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
