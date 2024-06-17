import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/quran/detail_surah_page.dart';
import 'package:penulisan_ilmiah_application/services/api/quran.dart';
import 'package:quran/quran.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Al-Qur'an",
          style: GoogleFonts.oswald(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchDataQuran(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green[600],
                ),
              );
            }
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    final getDataSurah = data[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "${getDataSurah.nomor}",
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                          title: Text(getDataSurah.namaLatin,
                              style: GoogleFonts.openSansCondensed(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          subtitle: Text(getDataSurah.arti,
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Colors.grey)),
                          trailing: Text(getSurahNameArabic(getDataSurah.nomor),
                              style: const TextStyle(fontSize: 20)),
                          isThreeLine: false,
                          dense: true,
                          onTap: () {
                            Get.to(DetailSurahPage(
                              data: getDataSurah,
                            ));
                          },
                        ),
                        const Divider()
                      ],
                    );
                  });
            }
            return Container();
          }),
    );
  }
}