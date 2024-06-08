import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../services/firebase/firestore.dart';

class EditJadwalPage extends StatefulWidget {
  const EditJadwalPage({super.key});

  @override
  _EditJadwalPageState createState() => _EditJadwalPageState();
}

class _EditJadwalPageState extends State<EditJadwalPage> {
  TextEditingController _tanggal = TextEditingController();
  TextEditingController _khatib = TextEditingController();
  TextEditingController _imam = TextEditingController();
  TextEditingController _muadzin = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _tanggal.dispose();
    _khatib.dispose();
    _imam.dispose();
    _muadzin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jadwal Jum'at",
          style: GoogleFonts.oswald(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TANGGAL",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _tanggal,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "HARI / BULAN / TAHUN",
                      hintStyle:
                          GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN TANGGAL PERIODE !";
                      }
                      return null;
                    },
                    onTap: () {
                      selectDate();
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "KHATIB JUM'AT",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _khatib,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN NAMA KHATIB !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "IMAM JUM'AT",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _imam,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAP MENGISIKAN NAMA IMAM !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "MUADZIN",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _muadzin,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "HARAH MENGISIKAN NAMA MUADZIN !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    child: Center(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("SIMPAN",
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_tanggal.text == "" ||
                          _khatib.text == "" ||
                          _imam.text == "" ||
                          _muadzin.text == "") {
                        _formKey.currentState?.validate();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red[600],
                            content: Text(
                              "HARAP MENGISIKAN SEMUA DATA !!!",
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      } else {
                        collectionRefJadwal.add({
                          'tanggaljumat': _tanggal.text,
                          'khatib': _khatib.text,
                          'imam': _imam.text,
                          'muadzin': _muadzin.text,
                          'timestamp': FieldValue.serverTimestamp()
                        });
                        //Mengosongkan text field ketika data berhasil masuk
                        _tanggal.text = "HARI / BULAN / TAHUN";
                        _khatib.text = " ";
                        _imam.text = " ";
                        _muadzin.text = " ";

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green[600],
                            content: Text(
                              "JADWAL BERHASIL DISIMPAN",
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
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
        _tanggal.text = DateFormat("d MMMM yyyy").format(setDate).toString();
      });
    }
  }
}
