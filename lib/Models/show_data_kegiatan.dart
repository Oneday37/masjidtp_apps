import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataKegiatan extends StatefulWidget {
  String tanggalKegiatan;
  String namaKegiatan;
  String deskripsiKegiatan;
  String dokumentasiKegiatan;
  Function() detailKegiatan;

  ShowDataKegiatan({
    required this.tanggalKegiatan,
    required this.namaKegiatan,
    required this.deskripsiKegiatan,
    required this.dokumentasiKegiatan,
    required this.detailKegiatan,
  });

  @override
  State<ShowDataKegiatan> createState() => _ShowDataKegiatanState();
}

class _ShowDataKegiatanState extends State<ShowDataKegiatan> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.namaKegiatan,
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(widget.deskripsiKegiatan,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(fontSize: 13, color: Colors.grey)),
            trailing: Text(widget.tanggalKegiatan,
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            isThreeLine: false,
            dense: true,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Colors.black,
              )),
        ],
      ),
      onTap: () {
        widget.detailKegiatan();
      },
    );
  }
}
