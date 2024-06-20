import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/models/show_edit_data_kegiatan.dart';
import 'package:penulisan_ilmiah_application/services/firebase/firestore.dart';
import 'edit_kegiatan_page.dart';

class OptionEditPage extends StatelessWidget {
  const OptionEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Kegiatan", style: GoogleFonts.oswald(fontSize: 27)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: StreamBuilder(
                stream: collectionRefKegiatan
                    .orderBy("entryTime", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container();
                  } else {
                    return Column(
                      children: snapshot.data!.docs.map((e) {
                        return ShowEditDataKegiatan(
                          tanggalKegiatan:
                              (e.data() as dynamic)['tanggalKegiatan']
                                  .toString(),
                          namaKegiatan:
                              (e.data() as dynamic)['namaKegiatan'].toString(),
                          deskripsiKegiatan:
                              (e.data() as dynamic)['deskripsiKegiatan']
                                  .toString(),
                          dokumentasiKegiatan:
                              (e.data() as dynamic)['dokumentasiKegiatan']
                                  .toString(),
                          editEvent: () async {
                            DocumentSnapshot documentSnapshot =
                                await collectionRefKegiatan.doc(e.id).get();
                            Get.to(EditKegiatanPage(
                              documentSnapshot: documentSnapshot,
                            ));
                          },
                          deleteEvent: () {
                            collectionRefKegiatan.doc(e.id).delete();
                          },
                        );
                      }).toList(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
