import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataJadwal extends StatefulWidget {
  String khatib;
  String muadzin;
  String tanggaljumat;
  Function() editjadwal;

  ShowDataJadwal({
    required this.khatib,
    required this.muadzin,
    required this.tanggaljumat,
    required this.editjadwal,
  });

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jum'at, ${widget.tanggaljumat}",
                  style: GoogleFonts.oswald(fontSize: 18)),
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    widget.editjadwal();
                  })
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: Text("KHATIB DAN IMAM",
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Text(":",
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.khatib,
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.bold),
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
                width: MediaQuery.of(context).size.width / 2.7,
                child: Text("MUADZIN",
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Text(":",
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(widget.muadzin,
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
