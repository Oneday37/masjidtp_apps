import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowDataKas extends StatefulWidget {
  String sisaKas;
  String pemasukan;
  String pengeluaran;

  ShowDataKas(
      {required this.sisaKas,
      required this.pemasukan,
      required this.pengeluaran});

  @override
  State<ShowDataKas> createState() => _ShowDataKasState();
}

class _ShowDataKasState extends State<ShowDataKas> {
  String formatCurrency(String value) {
    final number =
        int.tryParse(value.replaceAll('.', '').replaceAll('.', '')) ?? 0;
    final format =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(number);
  }

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
                      color: Colors.blue[600]!.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                  right: 0,
                  child: Opacity(
                    opacity: 0.15,
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
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(formatCurrency(widget.sisaKas),
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(width: 10),
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
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(formatCurrency(widget.pemasukan),
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(width: 10),
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
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(formatCurrency(widget.pengeluaran),
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ],
        ));
  }
}
