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
            .orderBy('entryTime', descending: true)
            .limit(1)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Periode: Periode Kas Belum Di Input",
                  style: GoogleFonts.oswald(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        //Sisa Kas Masjid
                        Stack(
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.blue[600]!.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                              right: 0,
                              child: Opacity(
                                opacity: 0.09,
                                child: Image.asset(
                                  "assets/rupiah.png",
                                  fit: BoxFit.cover,
                                  width: 150,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text("Sisa Kas Masjid",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text("Rp. 0",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),

                        //Pemasukan Kas Masjid
                        Stack(
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 255, 94),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                              top: 10,
                              right: -30,
                              child: Opacity(
                                opacity: 0.09,
                                child: Image.asset(
                                  "assets/income_money.jpg",
                                  fit: BoxFit.cover,
                                  width: 200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text("Pemasukan Kas Masjid",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text("Rp. 0",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),

                        //Pengeluaran Kas Masjid
                        Stack(
                          children: [
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.red[600]!.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Positioned(
                              right: -5,
                              child: Image.asset(
                                "assets/pengeluaran.png",
                                fit: BoxFit.cover,
                                width: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text("Pengeluaran Kas Masjid",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text("Rp. 0",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            );
          }
          return Column(
            children: snapshot.data!.docs.map((e) {
              return ShowDataKas(
                  periode: (e.data() as dynamic)['periodeKas'].toString(),
                  sisaKas: (e.data() as dynamic)['sisaKas'].toString(),
                  pemasukan: (e.data() as dynamic)['pemasukanKas'].toString(),
                  pengeluaran:
                      (e.data() as dynamic)['pengeluaranKas'].toString());
            }).toList(),
          );
        });
  }
}
