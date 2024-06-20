import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/models/show_data_kegiatan.dart';
import 'package:penulisan_ilmiah_application/pages/daftar_kegiatan_page.dart';
import 'package:penulisan_ilmiah_application/pages/detail_kegiatan_page.dart';
import 'package:penulisan_ilmiah_application/services/firebase/firestore.dart';

class EventSection extends StatefulWidget {
  const EventSection({super.key});

  @override
  State<EventSection> createState() => _EventState();
}

class _EventState extends State<EventSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
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
                  style: GoogleFonts.oswald(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            StreamBuilder(
                stream: collectionRefKegiatan
                    .orderBy('entryTime', descending: true)
                    .limit(5)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "Error ${snapshot.error}",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text(
                      "Belum ada kegiatan yang ditambahkan",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    );
                  } else {
                    return Column(
                      children: [
                        Column(
                            children: snapshot.data!.docs.map((e) {
                          return ShowDataKegiatan(
                            tanggalKegiatan:
                                (e.data() as dynamic)['tanggalKegiatan']
                                    .toString(),
                            namaKegiatan: (e.data() as dynamic)['namaKegiatan']
                                .toString(),
                            deskripsiKegiatan:
                                (e.data() as dynamic)['deskripsiKegiatan']
                                    .toString(),
                            dokumentasiKegiatan:
                                (e.data() as dynamic)['dokumentasiKegiatan']
                                    .toString(),
                            detailKegiatan: () async {
                              DocumentSnapshot documentSnapshot =
                                  await collectionRefKegiatan.doc(e.id).get();
                              Get.to(DetailKegiatanPage(
                                  getData: documentSnapshot));
                            },
                          );
                        }).toList()),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              child: const Text(
                                "+ Lainnya",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Get.to(const DaftarKegiatanPage());
                              }),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
