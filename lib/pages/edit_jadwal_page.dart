import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Services Firebase/firesstore.dart';

class EditJadwalPage extends StatefulWidget {
  final DocumentSnapshot? documentSnapshot;
  EditJadwalPage({this.documentSnapshot});

  @override
  _EditJadwalPageState createState() => _EditJadwalPageState();
}

class _EditJadwalPageState extends State<EditJadwalPage> {
  String tanggal = "Tanggal";

  TextEditingController _khatib = TextEditingController();
  TextEditingController _muadzin = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   if (widget.documentSnapshot != null) {
  //     Map<String, dynamic>? data =
  //         widget.documentSnapshot!.data() as Map<String, dynamic>?;
  //     if (data != null) {
  //       tanggal = data['tanggaljumat'] ?? "Tanggal";
  //       _khatib.text = data['khatib'] ?? '';
  //       _muadzin.text = data['muadzin'] ?? '';
  //     }
  //   }
  // }

  @override
  void dispose() {
    _khatib.dispose();
    _muadzin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jadwal Jum'at"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TANGGAL",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(tanggal, style: GoogleFonts.poppins(fontSize: 18))
                    ],
                  ),
                ),
              ),
              onTap: () {
                selectDate();
              },
            ),
            const SizedBox(height: 20),
            Text(
              "KHATIB DAN IMAM",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _khatib,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "MUADZIN",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _muadzin,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              child: Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "SIMPAN",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                if (widget.documentSnapshot == null) {
                  await collectionReference.add({
                    'tanggaljumat': tanggal,
                    'khatib': _khatib.text,
                    'muadzin': _muadzin.text,
                  });
                } else {
                  await widget.documentSnapshot!.reference.update({
                    'tanggaljumat': tanggal,
                    'khatib': _khatib.text,
                    'muadzin': _muadzin.text,
                  });
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Jadwal telah diupdate")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future selectDate() async {
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (setDate != null) {
      setState(() {
        tanggal = DateFormat("d MMMM yyyy").format(setDate).toString();
      });
    }
  }
}
