import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/pages/detail_kegiatan_page.dart';
import 'package:penulisan_ilmiah_application/services/firebase/firestore.dart';

class DaftarKegiatanPage extends StatefulWidget {
  const DaftarKegiatanPage({super.key});

  @override
  State<DaftarKegiatanPage> createState() => _DaftarKegiatanPageState();
}

class _DaftarKegiatanPageState extends State<DaftarKegiatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Daftar Kegiatan Masjid"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: collectionRefKegiatan
              .orderBy('entryTime', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.green[600]));
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot getData = snapshot.data!.docs[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(getData['namaKegiatan'],
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          subtitle: Text(getData['deskripsiKegiatan'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 13, color: Colors.grey)),
                          trailing: Text(getData['tanggalKegiatan'],
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          isThreeLine: false,
                          dense: true,
                          onTap: () {
                            Get.to(DetailKegiatanPage(
                              getData: getData,
                            ));
                          },
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              color: Colors.black,
                            )),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
