import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/services/api/detail_surah.dart';
import 'package:quran/quran.dart';

import '../services/api/quran.dart';

class DetailSurahPage extends StatefulWidget {
  DataQuran data;
  DetailSurahPage({super.key, required this.data});

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.data.namaLatin,
              style: GoogleFonts.oswald(fontSize: 25),
            ),
            Text(widget.data.arti,
                style: GoogleFonts.oswald(fontSize: 15, color: Colors.grey))
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FutureBuilder(
            future: fetchDetailSurah(widget.data.nomor),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }
              if (snapshot.hasData) {
                final data = snapshot.data;
                if (widget.data.nomor == 1 || widget.data.nomor == 9) {
                  return isiSurah(data);
                } else {
                  return ListView(
                    children: [
                      const Center(
                          child: Text(basmala, style: TextStyle(fontSize: 30))),
                      const SizedBox(height: 20),
                      isiSurah(data),
                    ],
                  );
                }
              }
              return Text("Error: ${snapshot.error}");
            }),
      ),
    );
  }

  ListView isiSurah(DataSurah? data) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data!.jumlahAyat,
        itemBuilder: (context, index) {
          final getDetailSurah = data.ayat[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    getVerse(data.nomor, getDetailSurah.nomorAyat) +
                        getVerseEndSymbol(getDetailSurah.nomorAyat),
                    style: GoogleFonts.roboto(fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getDetailSurah.teksIndonesia,
                    style: GoogleFonts.roboto(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const Divider()
            ],
          );
        });
  }
}
