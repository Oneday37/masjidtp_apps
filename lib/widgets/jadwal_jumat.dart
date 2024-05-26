import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penulisan_ilmiah_application/Models/show_jadwal_jumat.dart';
import 'package:penulisan_ilmiah_application/Pages/edit_jadwal_page.dart';
import 'package:penulisan_ilmiah_application/Services%20Firebase/firesstore.dart';

class JadwalJumat extends StatefulWidget {
  const JadwalJumat({super.key});

  @override
  State<JadwalJumat> createState() => _JadwalJumatState();
}

class _JadwalJumatState extends State<JadwalJumat> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.docs.map((e) {
                  return ShowDataJadwal(
                    khatib: (e.data() as dynamic)['khatib'].toString(),
                    muadzin: (e.data() as dynamic)['muadzin'].toString(),
                    tanggaljumat:
                        (e.data() as dynamic)['tanggaljumat'].toString(),
                    editjadwal: () async {
                      DocumentSnapshot documentSnapshot =
                          await collectionReference.doc(e.id).get();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditJadwalPage(
                            documentSnapshot: documentSnapshot);
                      }));
                    },
                  );
                }).toList(),
              );
            }
            return Container();
          }),
    ));
  }
}
