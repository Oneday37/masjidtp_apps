import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataJadwal extends StatefulWidget {
  String tanggalJumat;
  String khatib;
  String imam;
  String muadzin;

  ShowDataJadwal(
      {required this.tanggalJumat,
      required this.khatib,
      required this.muadzin,
      required this.imam});

  @override
  State<ShowDataJadwal> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowDataJadwal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jum'at, ${widget.tanggalJumat}",
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
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              Text(":",
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.khatib,
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              )
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
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              Text(":",
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.imam,
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              )
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
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              Text(":",
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(widget.muadzin,
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
