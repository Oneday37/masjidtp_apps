import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/show_data_kas.dart';
import '../services/firebase/firestore.dart';

class Finance extends StatefulWidget {
  String? sisaKas;
  String? pemasukan;
  String? pengeluaran;

  Finance({
    this.sisaKas,
    this.pemasukan,
    this.pengeluaran,
  });
  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: collectionRefKas
            .orderBy('timestamp', descending: true)
            .limit(1)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.blue[600]!.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("Sisa Kas Masjid",
                              style: GoogleFonts.roboto(fontSize: 18)),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text("Rp. 0",
                              style: GoogleFonts.roboto(fontSize: 18)),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.green[600]!.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Opacity(
                          opacity: 0.13,
                          child: Image.asset(
                            "assets/rupiah.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("Pemasukan Kas Masjid",
                              style: GoogleFonts.roboto(fontSize: 18)),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text("Rp. 0",
                              style: GoogleFonts.roboto(fontSize: 18)),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.red[600]!.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Opacity(
                          opacity: 0.13,
                          child: Image.asset(
                            "assets/rupiah.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("Pengeluaran Kas Masjid",
                              style: GoogleFonts.roboto(fontSize: 18)),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text("Rp. 0",
                              style: GoogleFonts.roboto(fontSize: 20)),
                        ),
                      ],
                    ),
                  ],
                ));
          }
          return Column(
            children: snapshot.data!.docs.map((e) {
              return ShowDataKas(
                  sisaKas: (e.data() as dynamic)['sisaKas'].toString(),
                  pemasukan: (e.data() as dynamic)['pemasukanKas'].toString(),
                  pengeluaran:
                      (e.data() as dynamic)['pengeluaranKas'].toString());
            }).toList(),
          );
        });
  }
}
