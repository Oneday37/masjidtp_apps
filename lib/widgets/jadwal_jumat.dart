import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/models/show_jadwal_jumat.dart';
import '../services/firebase/firestore.dart';

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
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: StreamBuilder(
          stream: collectionRefJadwal
              .orderBy('entryTime', descending: true)
              .limit(1)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Jadwal Jum'at",
                      style: GoogleFonts.oswald(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Text(
                      "Error ${snapshot.error}",
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jum'at, -",
                        style: GoogleFonts.oswald(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Text("KHATIB JUM'AT",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        Text(":",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "-",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Text("IMAM JUM'AT",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        Text(":",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "-",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Text("MUADZIN",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        Text(":",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "-",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: snapshot.data!.docs.map((e) {
                  return ShowDataJadwal(
                      tanggalJumat:
                          (e.data() as dynamic)['tanggalJumat'].toString(),
                      khatib: (e.data() as dynamic)['khatib'].toString(),
                      imam: (e.data() as dynamic)['imam'].toString(),
                      muadzin: (e.data() as dynamic)['muadzin'].toString());
                }).toList(),
              );
            }
          }),
    ));
  }
}
