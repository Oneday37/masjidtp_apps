import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowEditDataKegiatan extends StatefulWidget {
  String tanggalKegiatan;
  String namaKegiatan;
  String deskripsiKegiatan;
  String dokumentasiKegiatan;
  Function() editEvent;
  Function() deleteEvent;

  ShowEditDataKegiatan(
      {required this.tanggalKegiatan,
      required this.namaKegiatan,
      required this.deskripsiKegiatan,
      required this.dokumentasiKegiatan,
      required this.editEvent,
      required this.deleteEvent});

  @override
  State<ShowEditDataKegiatan> createState() => _ShowEditDataKegiatanState();
}

class _ShowEditDataKegiatanState extends State<ShowEditDataKegiatan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.namaKegiatan,
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Text(widget.deskripsiKegiatan,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 13, color: Colors.grey)),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        widget.editEvent();
                      }),
                  IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {
                        widget.deleteEvent();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
