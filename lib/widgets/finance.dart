import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(15)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text("Sisa Kas Masjid",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text("Rp. ${widget.sisaKas}",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Stack(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(15)),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/rupiah.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text("Pemasukan Kas Masjid",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text("Rp. ${widget.pemasukan}",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Stack(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/rupiah.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text("Pengeluaran Kas Masjid",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text("Rp. ${widget.pengeluaran}",
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
              ],
            ),
          ],
        ));
  }
}
